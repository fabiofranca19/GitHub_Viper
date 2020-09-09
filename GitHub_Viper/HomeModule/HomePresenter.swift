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
        let title = interactor.getRepositories()
        //let repositories = createRepositories(title: title)
        
        //viewController.updateTitle(repositorie: repositories)
    }
    
    
}
