//
//  ComponentWidget.swift
//  youtube
//
//  Created by Agis on 29/05/24.
//

import SwiftUI


// Chip Widget
struct ChipWidget: View{
    var text: String
    var isActive: Bool = false
    var body: some View {
        Text(text)
            .foregroundColor(isActive ? Color.black : Color.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isActive ? Color.white : Color("black1"))
            .cornerRadius(8)
    }
}


// Profile Letter Initial
struct InitialProfile: View {
    var width: CGFloat = 24
    var height: CGFloat = 24
    var color: Color = Color.blue
    var initial: String
    var body: some View {
        ZStack {
            Circle().fill(color).frame(width: width, height: height)
            Text(initial).foregroundColor(.white)
        }
    }
}



// Video Card
struct Video: View {
    var thumbnail: String
    var duration: String
    var title: String
    var subtitle: String
    var body: some View {
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image(thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text(duration)
                    .padding(.all, 5)
                    .foregroundColor(.white)
                    .background(.black)
                    .font(.caption)
                    .cornerRadius(5)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
                
            }
            
            HStack(alignment: .top, spacing:20){
                InitialProfile(width: 28, height: 28, color: Color.pink, initial: "F")
                VStack(alignment:.leading){
                    Text(title).font(.system(size: 16)).foregroundColor(.white).padding(.bottom, 4)
                    HStack{
                        Text(subtitle).font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
                    }
                }
                Spacer()
                Image("More")
            }
            .padding(.horizontal, 12)
            .padding(.top, 12)
            .padding(.bottom, 20)
        }
    }
}

// Video History
struct VideoHistory: View {
    var thumbnail: String
    var duration: String
    var title: String
    var channel: String
    var views: String
    var time: String
    var body: some View {
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image(thumbnail)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
                
                Text(duration)
                    .padding(.all, 5)
                    .foregroundColor(.white)
                    .background(.black)
                    .font(.caption)
                    .cornerRadius(5)
                    .padding(.trailing, 8)
                    .padding(.bottom, 15)
                
                ZStack(alignment: .leading){
                    Rectangle()
                        .foregroundColor(.black.opacity(0.8))
                        .opacity(0.2)
                        .frame(height: 2.0)
                    Rectangle()
                        .foregroundColor(Color("red"))
                        .frame(width: 200.0, height: 3.0)
                }.padding(.horizontal, 5)
            }
            
            
            HStack(alignment: .top, spacing:20){
                VStack(alignment:.leading){
                    Text(title).lineLimit(2).font(.system(size: 16)).foregroundColor(.white).padding(.bottom, 4)
                    Text(channel).font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).padding(.bottom, 0.5)
                    Text("\(views) views · \(time)").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
                }
                Spacer()
                Image("More")
            }
            .padding(.top, 12)
            .padding(.bottom, 20)
        }.frame(width: 300)
    }
}

// Short Card
struct Short: View {
    var image: String
    var title: String
    var views: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                ZStack {
                    VStack(alignment:.leading){
                        HStack{
                            Spacer()
                            Image("More")
                        }
                        Spacer()
                        Text(title)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 3)
                        
                        Text("\(views) views")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                    }
                }.padding(10), alignment: .bottomLeading)
    }
}

// Icon Button
struct IconButtonV: View {
    var icon: String
    var text: String
    var body: some View {
        VStack{
            Image(icon).resizable().frame(width: 30, height: 30)
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
    }
}
