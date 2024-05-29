//
//  HomeView.swift
//  youtube
//
//  Created by Agis on 28/05/24.
//

import SwiftUI

struct HomeView: View{
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        Image("Explore").resizable().frame(width: 24, height: 24)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color("black1"))
                            .cornerRadius(4)
                            .padding(.trailing, 16)
                            .padding(.leading, 12)
                        
                        ChipWidget(text: "All", isActive: true)
                        ChipWidget(text: "Under 10 min")
                        ChipWidget(text: "Music")
                        ChipWidget(text: "Tutorial")
                    }
                }.padding(.top, 10)
                ListVideo()
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

struct ListVideo: View {
    var body: some View {
        List{
            Video(thumbnail: "thumb-1", duration: "55:10", title: "The Beauty of Existence - Heart Touching", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            // Short
            ListShort().listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-2", duration: "10:32", title: "Config 2022 Opening Keynote - Dylan Field", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-3", duration: "18:43", title: "How to Export Figma Prototype to Video", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            // Continue Watching
           ListHistoryWatch().listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-4", duration: "10:32", title: "Build your design system - Lesson 3 : Introduction to design systems", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
            
            Video(thumbnail: "thumb-5", duration: "27:01", title: "Intro to Figma: How to make diagrams with FigJam", subtitle: "Figma · 437K views · 7 days ago").listRowInsets(EdgeInsets())
        }
        .listRowSpacing(20)
        .listStyle(.plain)
        .listStyle(.grouped)
    }
}

// List Short Video
struct ListShort: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack{
                Image("Short_Color").resizable().frame(width: 24, height: 24)
                Text("Shorts").font(.system(size: 16)).foregroundColor(.white).fontWeight(.bold)
            }.listRowInsets(EdgeInsets()).padding(.horizontal, 12).padding(.bottom, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:12){
                    Short(image: "short-1", title: "Satisfying And Relaxing Compilation...", views: "24M").padding(.leading, 12)
                    Short(image: "short-2", title: "Satisfying And Relaxing Compilation...", views: "24M")
                    Short(image: "short-3", title: "Satisfying And Relaxing Compilation...", views: "24M")
                    Short(image: "short-4", title: "Satisfying And Relaxing Compilation...", views: "24M")
                }
            }
        }
    }
}

struct ListHistoryWatch: View {
    var body: some View {
        VStack{
            HStack{
                Text("Continue Watching").font(.system(size: 16)).foregroundColor(.white).fontWeight(.bold)
                Spacer()
                Image("More")
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:20){
                    VideoHistory(thumbnail: "thumb-1", duration: "10:32", title: "Build your design system - Lesson 3 : Introduction to design systems", channel: "Figma", views: "437K", time:"7 days ago").padding(.leading, 12)
                    VideoHistory(thumbnail: "thumb-2", duration: "10:32", title: "Build your design system - Lesson 3 : Introduction to design systems", channel: "Figma", views: "437K", time:"7 days ago")
                    VideoHistory(thumbnail: "thumb-3", duration: "10:32", title: "Build your design system - Lesson 3 : Introduction to design systems", channel: "Figma", views: "437K", time:"7 days ago")
                }
            }
        }
    }
}
