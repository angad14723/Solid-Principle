//
//  UsersListView.swift
//  users
//
//  Created by Angad on 17/10/24.
//

import SwiftUI


struct UsersListView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View{
        
        NavigationView{
            
            List {
                if viewModel.isLoading {
                    ProgressView()
                }else {
                    ForEach(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
        
    }
}

