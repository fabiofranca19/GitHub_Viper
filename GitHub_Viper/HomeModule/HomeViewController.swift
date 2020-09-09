//
//  ViewController.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import UIKit

protocol HomeView {
    func updateRepositories(repositories: [RepositorieViewModel])
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: HomePresentation?
    
    var repositories = [RepositorieViewModel]() {
        didSet{
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    private func updateView() {
        print(repositories)
    }
}

extension HomeViewController: HomeView {
    func updateRepositories(repositories: [RepositorieViewModel]) {
        self.repositories = repositories
    }
    
}

