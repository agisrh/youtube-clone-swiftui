//
//  SubscriptionView.swift
//  youtube
//
//  Created by Agis on 30/05/24.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        NavigationView{
            VStack{
                // Users Online
                Users()
                
                // Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ChipWidget(text: "All", isActive: true).padding(.leading, 12)
                        ChipWidget(text: "Today")
                        ChipWidget(text: "Continue watching")
                        ChipWidget(text: "Unwatched")
                    }
                }.padding(.vertical, 10)
                
                // Videos
                VideoSubs()
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


struct Users: View {
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    UserOnline(image: "avatar-1", name: "Daryl Kimbler", isOnline: true).padding(.leading, 12)
                    UserOnline(image: "avatar-5", name: "Cindy", isOnline: true)
                    UserOnline(image: "avatar-3", name: "Derrick Sims")
                    UserOnline(image: "avatar-4", name: "Emily", isOnline: true)
                    UserOnline(image: "avatar-2", name: "Catherine")
                    UserOnline(image: "avatar-6", name: "Matthew Trimble", isOnline: true)
                }
            }.frame(width: UIScreen.screenWidth - 50)
            Text("All")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 50)
        }.padding(.top, 10)
    }
}


struct VideoSubs: View {
    var body: some View {
        List{
            Video(thumbnail: "thumb-1", duration: "55:10", title: "The Beauty of Existence - Heart Touching", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-2", duration: "10:32", title: "Config 2022 Opening Keynote - Dylan Field", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-3", duration: "18:43", title: "How to Export Figma Prototype to Video", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-4", duration: "10:32", title: "Build your design system - Lesson 3 : Introduction to design systems", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-5", duration: "27:01", title: "Intro to Figma: How to make diagrams with FigJam", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
        }
        .listRowSpacing(20)
        .listStyle(.plain)
        .listStyle(.grouped)
    }
}
