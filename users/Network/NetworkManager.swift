//
//  NetworkManager.swift
//  users
//
//  Created by Angad on 17/10/24.
//

import Foundation


enum NetworkError : Error{
    case BadURL
    case NoData
    case DecodingError
}


protocol NetworkManagerProtocal {
    
    func fetchNetworkData<T : Decodable>(url: URL) async throws -> T
}

class NetworkManager: NetworkManagerProtocal{
    
    func fetchNetworkData<T>(url: URL) async throws -> T where T : Decodable {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        guard let decodeData = try? JSONDecoder().decode(T.self, from: data) else {
            throw  NetworkError.DecodingError
        }
        
        return decodeData
    }
    
    
}
