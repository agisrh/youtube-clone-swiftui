//
//  ShortView.swift
//  youtube
//
//  Created by Agis on 29/05/24.
//

import SwiftUI

struct ShortView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.bottom){
                    Image("short-video")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    HStack(alignment:.bottom){
                        ContentShort()
                        Spacer()
                        Buttons()
                    }.padding(12)
                }.padding(.bottom, 30)
            }.navigationBarItems(
                trailing: HStack(spacing: 18){
                    Image("Search_bold").resizable().frame(width: 24, height: 24)
                    Image("Camera_bold").resizable().frame(width: 24, height: 24)
                    Image("More_bold").resizable().frame(width: 24, height: 24)
                }
            )
        }
    }
}


struct Buttons: View {
    var body: some View {
        VStack(spacing: 24){
            IconButtonV(icon: "Like2_Fill", text: "24K")
            IconButtonV(icon: "Dislike2_Fill", text: "Dislike")
            IconButtonV(icon: "Comment_Fill", text: "106")
            IconButtonV(icon: "Share_Fill", text: "Share")
            IconButtonV(icon: "Loop", text: "Remix")
            
            Image("profile")
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(.rect(cornerRadius: 6))
        }
    }
}

struct ContentShort: View {
    var body: some View {
        VStack(alignment:.leading){
            
            // Info Account
            HStack{
                Image("profile")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                
                Text("@agislaksamana")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                
                Text("Subscribe")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color("red_2"))
                    .cornerRadius(8)
            }
            
            
            // Description
            Text("DIY Toys | Satisfying And Relaxing | SADEK Tuts Tiktok Compition | Fidget Trading #SADEK #Shorts tiktok")
                .font(.system(size: 16))
                .padding(.vertical, 11)
            
            // Music Info
            HStack{
                Image("Music")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text("Original Sound")
                    .font(.system(size: 14))
            }
        }
    }
}
