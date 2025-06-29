//
//  UsersMessages.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Foundation

enum UsersMessages: String {
    case successfulRegistration = "Регистрация прошла успешно!"
    case emailAlreadyExists = "Пользователь с таким e-mail уже зарегистрирован"
    case successfulAuthorization = "Успешная авторизация!"
    case emailNotExists = "Такой e-mail не зарегистрирован"
    case wrongPassword = "Неправильный пароль"
    case successfulEditPersonalData = "Данные пользователя изменены успешно!"
    case successfulEditItemsInCart = "Данные корзины изменены успешно!"
}
