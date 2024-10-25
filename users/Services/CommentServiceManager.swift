//
//  CommentServiceManager.swift
//  users
//
//  Created by Angad on 22/10/24.
//

import Foundation



protocol CommentServiceManagerProtocal {
    func fetchComments() async throws -> [Comments]
}


class CommentServiceManager: CommentServiceManagerProtocal {
    
    var networkManager: NetworkManagerProtocal
    
    init(networkManager: NetworkManagerProtocal = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchComments() async throws -> [Comments] {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else{
            throw URLError(.badURL)
        }

        let data : [Comments] = try await networkManager.fetchNetworkData(url: url)
        return data
        
    }
    
}
