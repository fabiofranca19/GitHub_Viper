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
    func fetchImage(imageUrl: String, completion: @escaping ImageClosure)
}

class HomeInteractor {
    var service: RepositoriesAPI
    
    init(service: RepositoriesAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    func fetchImage(imageUrl: String, completion: @escaping ImageClosure) {
        guard let service = service as? ImageAPI else{ return }
        service.fetchImage(imageUrl: imageUrl) { (data) in
            completion(data)
        }
    }
    
    func getRepositories(completion: @escaping RepositoriesClosure) {
        service.fetchRepositories { (repositories) in
            completion(repositories)
        }
    }
    
    

}
