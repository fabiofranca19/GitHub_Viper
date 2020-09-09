//
//  RepositoriesService.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Alamofire

class RepositoriesService {
    private lazy var httpService = RepositoriesHttpService()
    static let shared: RepositoriesService = RepositoriesService()
    
    private func parseRepositories(result: AFDataResponse<Any>) -> [Repositorie] {
        guard [200,201].contains(result.response?.statusCode), let data = result.data else{
            return []
        }
        
        do{
            let repositories = try JSONDecoder().decode(Repositories.self, from: data)
            return repositories.repos
        }catch{
            debugPrint("Something wrong in the repositories parse: \(error.localizedDescription)")
            return []
        }
    }
}

extension RepositoriesService: RepositoriesAPI {
    func fetchRepositories(completion: @escaping RepositoriesClosure) {
        // Start making the http call to fetch
        do{
            try RepositoriesHttpRouter.getRepositories.request(usingHttpService: httpService).responseJSON(completionHandler: { (result) in
                let repositories = self.parseRepositories(result: result)
                completion(repositories)
            })
        }catch{
            debugPrint("Something wrong while fetching repositories: \(error.localizedDescription)")
        }
    }
    
    func fetchUser(completion: @escaping UserClosure) {
        
    }
    
    
}
