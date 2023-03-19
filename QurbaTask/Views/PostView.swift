//
//  PostView.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 19/03/2023.
//

import SwiftUI

struct PostView: View {
    
    var post:PostModel
    var openImage : ((Bool) -> Void)
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack(alignment: .center) {
                Image("postUserMale")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .onTapGesture {
                        openImage(true)
                    }
                VStack (alignment: .leading) {
                    Text(post.title ?? "Islam")
                        .bold()
                        .headlineView()
                    Text("\(post.reactions ?? 0) Like")
                        .footnoteView()
                }
            }
            
            Text(post.body ?? "Islam")
                .bodyView()
            
            Image("postProduct")
                .resizable()
                .onTapGesture {
                    openImage(false)
                }
            Divider()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: PostModel(), openImage: {_ in })
    }
}
