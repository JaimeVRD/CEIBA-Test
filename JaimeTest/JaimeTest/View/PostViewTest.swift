//
//  PostViewTest.swift
//  JaimeTest
//
//  Created by AltoMobile on 03/10/22.
//

import SwiftUI

struct PostViewTest: View {
    var userId : Int
   
    @StateObject var post = PostViewModel()
    
    var body: some View {
    
        VStack{
            Text(post.title)
                .font(.title)
                .foregroundColor(Color("GreenTop"))
            Text(post.body)
                .font(.body)
        }.onAppear{post.fetch(userId: userId)}
     
    }
}
