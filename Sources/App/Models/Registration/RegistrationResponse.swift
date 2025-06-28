//
//  RegistrationResponse.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Vapor

struct RegistrationResponse: Content {
    let result: Int
    let user_message: String?
    let error_message: String?
}
