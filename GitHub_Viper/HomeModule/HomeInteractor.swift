//
//  HomeInteractor.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

protocol HomeUseCase {
    func getRepositories() -> String
}

class HomeInteractor {
    
}

extension HomeInteractor: HomeUseCase {
    func getRepositories() -> String {
        return "Viper"
    }

}
