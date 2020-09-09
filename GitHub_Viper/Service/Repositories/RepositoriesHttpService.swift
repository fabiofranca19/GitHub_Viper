 //
//  RepositoriesHttpService.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Alamofire
 
 final class RepositoriesHttpService: HttpService {
    var sessionManger: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManger.request(urlRequest).validate(statusCode: 200..<400)
    }

 }
