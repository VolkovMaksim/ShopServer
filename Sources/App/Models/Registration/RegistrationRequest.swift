//
//  RegistrationRequest.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Vapor

struct RegistrationRequest: Content {
    var username: String
    var email: String
    var password: String
}
