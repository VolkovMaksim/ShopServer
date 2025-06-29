//
//  RegistrationRequest.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Vapor

struct RegistrationRequest: Content {
    let username: String
    let email: String
    let password: String
}
