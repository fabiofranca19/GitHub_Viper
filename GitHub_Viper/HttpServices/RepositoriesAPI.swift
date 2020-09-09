//
//  RepositoriesAPI.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

typealias RepositoriesClosure = ([Repositorie]) -> Void
typealias UserClosure = (User) -> Void

protocol RepositoriesAPI {
    func fetchRepositories(completion: @escaping RepositoriesClosure) -> Void
    func fetchUser(completion: @escaping UserClosure) -> Void
}
