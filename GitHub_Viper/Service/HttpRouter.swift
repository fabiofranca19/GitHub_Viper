//
//  HttpRouter.swift
//  GitHub_Viper
//
//  Created by Fábio França on 09/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Alamofire

protocol HttpRouter {
    var baseUrlString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?
    
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    
    var parameter: Parameters? { return nil }
    func body() throws -> Data? { return nil }
    
    func asURLRequest() throws -> URLRequest {
        //var url = try baseUrlString.asURL()
        //url.appendPathComponent(path)
        
        let urlBase = URL(string: baseUrlString)
        let url = urlBase.flatMap{  URL(string: $0.absoluteString + path) }
        
        var request = try URLRequest(url: url!, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}
