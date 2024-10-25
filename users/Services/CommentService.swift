//
//  CommentService.swift
//  users
//
//  Created by Angad on 22/10/24.
//



protocol CommentServiceProtocol {
    func fetchComments() async throws -> [Comments]
}

struct CommentService : CommentServiceProtocol{
    
    var services: CommentServiceManagerProtocal
    
    init(services: CommentServiceManagerProtocal = CommentServiceManager()) {
        self.services = services
    }
    
    
    func fetchComments() async throws -> [Comments] {
        return  try await services.fetchComments()
    }
    
}
