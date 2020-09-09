//
//  HomeInteractor.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

protocol HomeUseCase {
    func getRepositories(completion: @escaping RepositoriesClosure)
}

class HomeInteractor {
    var service: RepositoriesAPI
    
    init(service: RepositoriesAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    func getRepositories(completion: @escaping RepositoriesClosure) {
        service.fetchRepositories { (repositories) in
            completion(repositories)
        }
    }

}
