//
//  ContentView.swift
//  users
//
//  Created by Angad on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack(spacing: 16){
                
                NavigationLink(destination: UsersListView()){
                    Text("Users")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.green))
                       
                }
                
                NavigationLink(destination: CommentsView()){
                    Text("Comments")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.green))
                       
                }
                
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    ContentView()
}
