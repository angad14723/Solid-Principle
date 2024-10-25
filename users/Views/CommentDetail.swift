//
//  CommentDetail.swift
//  users
//
//  Created by Angad on 22/10/24.
//

import SwiftUI


struct CommentDetail: View {
    
    var comment: Comments
    
    var body: some View{
        NavigationView{
            
            VStack{
                Text(comment.name)
                Text(comment.email)
                Divider()
                Text(comment.body)
                
            }
            .navigationTitle(comment.name)
            
        }
    }
    
}

#Preview {
    CommentDetail(comment: Comments(postId: 1, id: 2, name: "Individual Comment", email: "dummy@gmail.com", body: "ksmvosdjnvofnvolfnv csk sdkjv  skv skjv j j jnij jnj jpiu z"))
}
