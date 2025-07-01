//
//  AuthorizationResponse.swift
//  
//
//  Created by Maksim Volkov on 29.06.2025.
//

import Vapor

struct AuthorizationResponse: Content {
    let username: String?
    let email: String?
    let password: String?
    let creditCard: String?
    let utemsInCart: [String]?
    let favourites: [String]?
    let result: Int
    let userMessage: String
}
