//
//  HomeModuleBuilder.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import UIKit

class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: viewController)
        let presenter = HomePresenter(viewController: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
