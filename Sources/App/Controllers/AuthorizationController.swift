//
//  AuthorizationController.swift
//  
//
//  Created by Maksim Volkov on 29.06.2025.
//

import Vapor

class AuthorizationController {
    let authorizedUser = AuthorizedUsers()
    var authStatus = 0
    func authorization(_ req: Request) throws -> EventLoopFuture<AuthorizationResponse> {
        // проверяем, что body - не дырка от бублика
        guard let body = try? req.content.decode(AuthorizationRequest.self) else {
            throw Abort(.badRequest)
        }
        // проверяем пользователя по email и usersMessage
        let (usersMessage, authUser) = authorizedUser.usersAuthorization(body: body)
        switch usersMessage.rawValue {
        case "Успешная авторизация!":
            authStatus = 1
        case "Такой e-mail не зарегистрирован":
            authStatus = 2
        case "Неправильный пароль":
            authStatus = 3
        default:
            authStatus = 0
        }
        let response = AuthorizationResponse(username: authUser?.username,
                                             email: authUser?.email,
                                             password: authUser?.password,
                                             creditCard: authUser?.creditCard,
                                             utemsInCart: authUser?.itemsInCart,
                                             favourites: authUser?.favourites,
                                             result: authStatus,
                                             // передаем клиенту сообщение о результате авторизации/проверки заняторсти email
                                             userMessage: usersMessage.rawValue)
        return req.eventLoop.future(response)
    }
}
