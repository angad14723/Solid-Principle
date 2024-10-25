//
//  Comments.swift
//  users
//
//  Created by Angad on 22/10/24.
//


struct Comments: Codable, Identifiable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
