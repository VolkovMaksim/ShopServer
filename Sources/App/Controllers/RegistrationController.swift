//
//  RegistrationController.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Vapor

class RegistrationController {
    let registeredUser = RegisteredUsers()
    var authStatus = 0
    func registration(_ req: Request) throws -> EventLoopFuture<RegistrationResponse> {
        // проверяем, что body - не дырка от бублика
        guard let body = try? req.content.decode(RegistrationRequest.self) else {
            throw Abort(.badRequest)
        }
        // передаем нового пользователя на проверку занятости e-mail и запись в словарь с получением сообщения об успешности/неуспешности
        let usersMessage = registeredUser.userRegistration(body: body)
        switch usersMessage.rawValue {
        case "Регистрация прошла успешно!":
            authStatus = 1
        case "Пользователь с таким e-mail уже зарегистрирован":
            authStatus = 2
        default:
            authStatus = 0
        }
        
        let response = RegistrationResponse(
            result: authStatus,
            // передаем клиенту сообщение о результате регистрации/проверки занятости e-mail
            userMessage: usersMessage.rawValue,
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
}
