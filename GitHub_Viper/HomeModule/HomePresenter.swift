//
//  HomePresenter.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
}

struct RepositorieViewModel {
    var name: String?
    var stars: Int?
    var description: String?
    var login: String?
    var imageUrl: String?
    
    init(repositorieModel: Repositorie) {
        self.name = repositorieModel.name
        self.stars = repositorieModel.stars
        self.description = repositorieModel.description
        self.login = repositorieModel.owner.login
        self.imageUrl = repositorieModel.owner.imageUrl
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
    
    func createRepositories(title: String){
        
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        interactor.getRepositories { (repositories) in
            self.viewController.updateRepositories(repositories: repositories)
        }
    }
    
    
}
