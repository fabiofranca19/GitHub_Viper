//
//  ImageAPI.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

typealias ImageClosure = (Data?) -> Void
protocol ImageAPI {
    func fetchImage(imageUrl:String,completion: @escaping ImageClosure)
}
