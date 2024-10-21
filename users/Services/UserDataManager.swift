//
//  UserService.swift
//  users
//
//  Created by Angad on 17/10/24.
//

import Foundation


protocol UserDataManagerProtocal {
    
    func fetchUsers() async  throws ->[User]
    func loadLocalData() -> [User]
    
}


class UserDataManager: UserDataManagerProtocal {
    
    
    private let networkManager: NetworkManagerProtocal
    private let userKEY = "userKEY"
    
    init(networkManager: NetworkManagerProtocal = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    
    func fetchUsers() async throws -> [User] {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
               throw URLError(.badURL)
           }

        let data : [User] =  try await networkManager.fetchNetworkData(url: url)
        
        saveUserToLocal(users: data)
        
        return data
        
    }
    
    func loadLocalData() -> [User] {
        
        guard let data = UserDefaults.standard.data(forKey: userKEY),
              let localData = try? JSONDecoder().decode([User].self, from: data) else {
            return []
        }
        
        return localData
    }
    
    private func saveUserToLocal(users: [User]){
        
        if let data = try? JSONEncoder().encode(users){
            UserDefaults.standard.set(data, forKey: userKEY)
        }
    }
}
