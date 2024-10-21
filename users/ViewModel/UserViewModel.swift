//
//  UserViewModel.swift
//  users
//
//  Created by Angad on 17/10/24.
//

import Foundation


class UserViewModel: ObservableObject{
    
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    var userService: UserServiceProtocol
    
    init(_ userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    
    func fetchUsers(){
        
        Task{
            do{
                let fetchedUsers = try await userService.fetchUsers()
                DispatchQueue.main.async {
                    self.users = fetchedUsers
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
