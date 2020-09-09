 //
//  RepositoriesHttpRouter.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Alamofire
 
 enum RepositoriesHttpRouter {
    case getRepositories
    case dowloadUserImage(imageUrl: String)
    case getUser(userLogin: String)
 }
 
 extension RepositoriesHttpRouter: HttpRouter {
    var baseUrlString: String {
        switch (self) {
        case .dowloadUserImage(let imageUrl):
            return imageUrl
        default:
            return "https://api.github.com/"
        }
    }
    
    var path: String {
        switch (self) {
        case .getRepositories:
            return "search/repositories?q=language:swift&sort=stars"
        case .dowloadUserImage(_):
            return ""
        case .getUser(let userLogin):
            return "users/\(userLogin)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return []
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    func body() throws -> Data? {
        return nil
    }

 }
