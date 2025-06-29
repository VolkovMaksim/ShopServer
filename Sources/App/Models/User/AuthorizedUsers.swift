//
//  File.swift
//  
//
//  Created by Maksim Volkov on 29.06.2025.
//

import Foundation

class AuthorizedUsers {
    let registeredUser = UserDefaults.standard
    
    // MARK: АВТОРИЗАЦИЯ
    
    func usersAuthorization(body: AuthorizationRequest) -> (UsersMessages, User?) {
        // достаем словарь с данными пользователя по email, если такой словарь есть
        guard let saveData = registeredUser.object(forKey: body.email) as? [String: Any] else {
            // если в памяти нет такого ключа-email
            return (.emailNotExists, nil)
        }
        // если в памяти есть запись по переданному email
        print(saveData)
        // проверяем соответствие введенного при авторизации пароля с паролем, хранящимся в памяти
        guard (saveData["password"] as! String) == body.password else {
            // если введен неправильный пароль
            return (.wrongPassword, nil)
        }
        // задаем свойства пользователю
        let authUser = User(username: saveData["username"] as! String,
                            email: saveData["email"] as! String,
                            password: saveData["password"] as! String,
                            creditCard: saveData["creditCard"] as! String,
                            itemsInCart: saveData["itemsInCart"] as! [String],
                            favourites: saveData["favourites"] as! [String])
        
        print(authUser)
        return (.successfulAuthorization, authUser)
    }
}
