//
//  ViewController.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import UIKit

protocol HomeView {
    func updateTitle(repositorie: Repositories)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: HomePresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

}

extension HomeViewController: HomeView {
    func updateTitle(repositorie: Repositories) {
        DispatchQueue.main.async {
            
        }
    }
}

