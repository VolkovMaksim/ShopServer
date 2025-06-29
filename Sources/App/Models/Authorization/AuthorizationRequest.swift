//
//  AuthorizationRequest.swift
//  
//
//  Created by Maksim Volkov on 29.06.2025.
//

import Vapor

struct AuthorizationRequest: Content {
    let email: String
    let password: String
}
