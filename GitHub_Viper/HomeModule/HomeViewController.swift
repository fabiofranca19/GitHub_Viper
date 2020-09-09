//
//  ViewController.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import UIKit

protocol HomeView {
    func updateRepositories(repositories: [Repositorie])
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: HomePresentation?
    
    var repositories = [Repositorie]()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

}

extension HomeViewController: HomeView {
    func updateRepositories(repositories: [Repositorie]) {
        DispatchQueue.main.async {
            self.repositories += repositories
            print(repositories)
        }
    }
}

