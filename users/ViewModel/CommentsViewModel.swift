//
//  CommentsViewModel.swift
//  users
//
//  Created by Angad on 22/10/24.
//

import Foundation


class CommentsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var comments: [Comments] = []
    @Published var errorMessage = ""
    
    var services: CommentServiceProtocol
    
    init(services: CommentServiceProtocol = CommentService()) {
        self.services = services
    }
    
    func fetchComments(){
        
        print("CommentsViewModel")
        isLoading = true
        Task{
            do{
                let data = try await services.fetchComments()
                
                DispatchQueue.main.async { [weak self] in
                    self?.comments = data
                    self?.isLoading = false
                }
                
            }catch{
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
    
    
}

