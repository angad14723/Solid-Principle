//
//  UserService.swift
//  users
//
//  Created by Angad on 17/10/24.
//


protocol UserServiceProtocol {
    
    func fetchUsers() async throws -> [User]
    func loadFromLocal() -> [User]
}

class UserService : UserServiceProtocol{
    
    var dataManager: UserDataManagerProtocal
    
    init(dataManager: UserDataManagerProtocal = UserDataManager()) {
        self.dataManager = dataManager
    }
    
    
    func fetchUsers() async throws -> [User] {
        
        let users =  try await dataManager.fetchUsers()
        
        print("UserService :: \(users)")
        
        if users.count > 0 {
            return users
        }else{
            return loadFromLocal()
        }
    }
    
    func loadFromLocal() -> [User] {
        let localData = dataManager.loadLocalData()
        return localData
    }
    
}
