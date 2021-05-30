//
//  User.swift
//  Homework2.4-MiniOrganizer
//
//  Created by vtsyganov on 29.05.2021.
//

import Foundation


class User: ObservableObject {
    
    var users: [Account] = []
    
    init() {
        print("Documents directory is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
        loadListUsers()
    }
    
    func printItems() {
        for user in users {
            print("-- \(user)")
        }
    }
    
    func findEmailIndex(_ email: String?) -> Int? {
        guard let email = email else { return nil }
        
        for index in users.indices {
            if users[index].email == email {
                return index
            }
        }
        return nil
    }
    
    func findUsernameIndex(_ username: String) -> Int? {
        for index in users.indices {
            if users[index].username == username {
                return index
            }
        }
        return nil
    }
    
    func addNewAccount(newAccount: Account) {
        users.append(newAccount)
        saveListUsers()
        printItems()
    }
    
    func deleteAccount(_ account: Account) {
        for index in users.indices {
            if users[index].id == account.id {
                users.remove(at: index)
                saveListUsers()
                printItems()
            }
        }
    }
    
    func documentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Users.plist")
    }
    
    func saveListUsers() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(users)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListUsers() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                users = try decoder.decode([Account].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
    
}
