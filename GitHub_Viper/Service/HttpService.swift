//
//  HttpService.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Alamofire

protocol HttpService {
    var sessionManger: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
