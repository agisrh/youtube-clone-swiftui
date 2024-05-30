//
//  LibraryView.swift
//  youtube
//
//  Created by Agis on 30/05/24.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                // Title
                HStack{
                    Text("Recent")
                        .font(.system(size: 16))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 12)
                    Spacer()
                }.padding(.horizontal, 12).padding(.top, 20)
                
                // Videos
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20){
                        VideoThumbHistory(image: "thumb-5", duration: "27:09", title: "Shorts", subtitle: "18 Watched", isShort: true).padding(.leading, 12)
                        
                        VideoThumbHistory(image: "thumb-3", duration: "27:09", title: "What's Figma?", subtitle: "4 Watched")
                        
                        VideoThumbHistory(image: "thumb-2", duration: "27:09", title: "Watch Later", subtitle: "Private")
                    }
                }.padding(.vertical, 10)
                Divider()
                
                // Menu
                VStack{
                    LibraryMenu(icon: "History", text: "History")
                    LibraryMenu(icon: "Play", text: "Your videos")
                    LibraryMenu(icon: "Download", text: "Downloads", subtitle: "67 videos", trailingIcon: Image(systemName: "checkmark.circle.fill"))
                    LibraryMenu(icon: "Movie", text: "Your movies")
                    LibraryMenu(icon: "Clock", text: "Watch later", subtitle: "4 unwatched videos")
                }.padding(.horizontal, 12)
                
                Divider()
                
                HStack{
                    Text("Playlits")
                        .font(.system(size: 16))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 12)
                    Spacer()
                    Text("Recently added")
                        .font(.system(size: 14))
                        .padding(.trailing, 12)
                    Image(systemName: "chevron.down")
                }.padding(.horizontal, 12)
                
                HStack{
                    Image(systemName: "plus").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("New Playlist")
                        .font(.system(size: 16))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 20)
                    Spacer()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 19)
                
                HStack{
                    Image("thumb-3")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .scaledToFit()
                        .padding(.trailing, 7)
                    VStack(alignment:.leading){
                        Text("Liked videos").font(.system(size: 16))
                        Text("52 videos").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
                    }
                    Spacer()
                }.padding(.horizontal, 12)
                
                Spacer()
            }.navigationBarItems(
                leading:  HStack {
                    Image("Youtube").resizable().frame(width: 86, height: 20)
                },
                trailing: HStack(spacing: 18){
                    Image("Cast").resizable().frame(width: 24, height: 24)
                    Image("Notification").resizable().frame(width: 24, height: 24)
                    Image("Search").resizable().frame(width: 24, height: 24)
                    Image("profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                }
            )
        }
    }
}


struct VideoThumbHistory: View {
    var image: String
    var duration: String
    var title: String
    var subtitle: String
    var isShort: Bool = false
    var body: some View {
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
                
                if(isShort){
                    Image("Short_Fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding(.all, 5)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(5)
                        .padding(.trailing, 5)
                        .padding(.bottom, 10)
                }else{
                    Text(duration)
                        .padding(.all, 5)
                        .foregroundColor(.white)
                        .background(.black)
                        .font(.system(size: 10))
                        .cornerRadius(5)
                        .padding(.trailing, 5)
                        .padding(.bottom, 10)
                }
                
                ZStack(alignment: .leading){
                    Rectangle()
                        .foregroundColor(.black.opacity(0.8))
                        .opacity(0.2)
                        .frame(height: 2.0)
                    Rectangle()
                        .foregroundColor(Color("red"))
                        .frame(width: 20.0, height: 3.0)
                }.padding(.horizontal, 5)
            }
            
            
            HStack(alignment: .top){
                VStack(alignment:.leading){
                    Text(title).lineLimit(2).font(.system(size: 14)).foregroundColor(.white)
                    Text(subtitle).font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
                    
                }
                Spacer()
                Image("More")
            }
            .padding(.top, 12)
            .padding(.bottom, 20)
        }.frame(width: 138)
    }
}

struct LibraryMenu: View {
    var icon: String
    var text: String
    var subtitle: String = ""
    var trailingIcon: Image?
    var body: some View {
        HStack{
            Image(icon).resizable().frame(width: 24, height: 24)
            VStack(alignment:.leading){
                Text(text).font(.system(size: 16)).padding(.leading, 24)
                if(!subtitle.isEmpty){
                    Text(subtitle)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.leading, 24)
                }
            }
            Spacer()
            trailingIcon
        }.padding(.bottom, 20)
    }
}
