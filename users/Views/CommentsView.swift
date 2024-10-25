//
//  CommentsView.swift
//  users
//
//  Created by Angad on 22/10/24.
//

import SwiftUI

struct CommentsView: View {
    
    @StateObject var viewModel = CommentsViewModel()
    
    var body: some View{
        
        NavigationView{
            List(){
                
                if viewModel.isLoading{
                    ProgressView()
                }
                
                if viewModel.errorMessage != ""{
                    Text(viewModel.errorMessage)
                }
                
                ForEach(viewModel.comments) { comment in
                    
                    NavigationLink(destination: CommentDetail(comment: comment)) {
                        VStack{
                            Text(comment.name)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            Text(comment.body)
                        }
                    }
                    
                }}.onAppear {
                    viewModel.fetchComments()
                }
                .navigationTitle("Comments")
            }
        }
}

#Preview {
    CommentsView()
}
