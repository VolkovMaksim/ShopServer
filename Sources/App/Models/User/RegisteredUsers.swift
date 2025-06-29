//
//  RegisteredUsers.swift
//  
//
//  Created by Maksim Volkov on 28.06.2025.
//

import Foundation

class RegisteredUsers {
    // создаем базу данных для сохранения регистрационных данных пользователей
    let registeredUsers = UserDefaults.standard
    
    // создаем пустой словарь для хранения пользовательских данных в формате [email:Any]
    var userDictionary = [String: Any]()
    
    
    //MARK: РЕГИСТРАЦИЯ
    
        // метод регистрации пользователя и проверки занятости e-mail
    func userRegistration(body: RegistrationRequest) -> UsersMessages {
        // проверяем словарь на наличие объекта с ключем e-mail
        guard let _ = registeredUsers.object(forKey: body.email) as? [String: Any] else {
            // если в UserDefaults нет записи по переданному e-mail, то добавляем данные пользователя в словарь и возвращаем ответ от сервера
            userDictionary["username"] = body.username
            userDictionary["email"] = body.email
            userDictionary["password"] = body.password
            userDictionary["creditCard"] = ""
            userDictionary["itemsInCart"] = []
            userDictionary["favourites"] = []
            
            // сохраняем словарь с данными нового пользователя
            registeredUsers.set(userDictionary, forKey: body.email)
            print(userDictionary)
            return .successfulRegistration
        }
        return .emailAlreadyExists
    }
}
