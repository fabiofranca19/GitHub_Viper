//
//  HomePresenter.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import UIKit

protocol HomePresentation {
    func viewDidLoad()
}

struct RepositorieViewModel {
    var name: String?
    var stars: Int?
    var description: String?
    var login: String?
    var image: UIImage?
    
    init(repositorieModel: Repositorie, imageData: Data) {
        self.name = repositorieModel.name
        self.stars = repositorieModel.stars
        self.description = repositorieModel.description
        self.login = repositorieModel.owner.login
        self.image = UIImage(data: imageData)
    }
}

class HomePresenter {
    
    var viewController: HomeView
    var interactor: HomeUseCase
    var router: HomeRouting
    
    init(viewController: HomeView,interactor: HomeUseCase, router: HomeRouting) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    private func onFetchImage(imageUrl: String, completion: @escaping ImageClosure) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.fetchImage(imageUrl: imageUrl) { (result) in
                completion(result)
            }
        }
    }
    
    private func onFetchRepositories(completion: @escaping RepositoriesClosure) {
        self.interactor.getRepositories(completion: { (result) in
            completion(result)
        })
    }
    
    func getViewModels(completion: @escaping ([RepositorieViewModel]) -> Void) {
        let myGroup = DispatchGroup()
        var viewModels = [RepositorieViewModel]()
        
        onFetchRepositories { (resultRepositories) in
            for repositorie in resultRepositories {
                myGroup.enter()
                self.onFetchImage(imageUrl: repositorie.owner.imageUrl) { (imageData) in
                    let viewModel = RepositorieViewModel(repositorieModel: repositorie, imageData: imageData ?? Data())
                    viewModels.append(viewModel)
                    
                    myGroup.leave()
                }
            }
            
            myGroup.notify(queue: .main) {
                completion(viewModels)
            }
        }
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        self.getViewModels { (viewModels) in
            self.viewController.updateRepositories(repositories: viewModels)
        }
    }
    
    
}
