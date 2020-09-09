//
//  Repositories.swift
//  GitHub_Viper
//
//  Created by Fábio França on 08/09/20.
//  Copyright © 2020 com.fabiofranca. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    var repos: [Repositorie]
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

struct Repositorie: Codable {
    var name: String
    var owner: Owner
    var description: String?
    var stars: Int
    
    enum CodingKeys: String, CodingKey{
        case name
        case owner
        case description
        case stars = "stargazers_count"
    }
}

struct Owner: Codable {
    var login: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey{
        case login
        case imageUrl = "avatar_url"
    }
}
