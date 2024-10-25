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
        isLoading = true
        
        Task{
            do{
                let fetchedUsers = try await userService.fetchUsers()
                DispatchQueue.main.async { [weak self] in
                    self?.users = fetchedUsers
                    self?.isLoading = false
                }
            }catch{
               
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                
                let fetchedUsers = userService.loadFromLocal()
                DispatchQueue.main.async { [weak self] in
                    self?.users = fetchedUsers
                    self?.isLoading = false
                }
            
            }
        }
    }
    
}
