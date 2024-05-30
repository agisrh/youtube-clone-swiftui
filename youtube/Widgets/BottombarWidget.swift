//
//  BottombarWidget.swift
//  youtube
//
//  Created by Agis on 28/05/24.
//

import SwiftUI

struct BottombarWidget: View{
    @State var isPresenting = false
    @State private var sheetHeight: CGFloat = .zero
    @State private var selectedTab = 0
    @State private var oldSelectedTab = 0
    
    
    var body: some View {
        TabView(selection:$selectedTab){
            HomeView().tabItem {
                selectedTab == 0 ? Image("Home_Fill") : Image("Home");
                Text("Home")
            }.tag(0)
            ShortView().tabItem {
                selectedTab == 1 ? Image("Short_Fill") : Image("Short");
                Text("Shorts")
            }.tag(1)
            BlankView().tabItem {
                Image("Add");
            }.tag(2)
            SubscriptionView().tabItem {
                selectedTab == 3 ? Image("Subscriptions_Fill") : Image("Subscriptions");
                Text("Subscriptions")
            }.tag(3)
            LibraryView().tabItem {
                selectedTab == 4 ? Image("Library_Fill") : Image("Library");
                Text("Library")
            }.tag(4)
        }
        .accentColor(.white)
        .onChange(of: selectedTab) { oldTab, newTab in
            if 2 == selectedTab {
                self.isPresenting = true
            } else {
                self.oldSelectedTab = newTab
            }
        }.sheet(isPresented: $isPresenting, onDismiss: {
            self.selectedTab = self.oldSelectedTab
        }) {
            // Show Modal
            VStack{
                HStack{
                    Text("Create").font(.system(size: 20)).fontWeight(.bold)
                    Spacer()
                    Image(systemName: "xmark").onTapGesture {
                        self.isPresenting = false
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 24)
                
                VStack{
                    CreateMenu(icon: "Short", text: "Create a short")
                    CreateMenu(icon: "Upload", text: "Upload a video")
                    CreateMenu(icon: "Wave", text: "Go live")
                    CreateMenu(icon: "Edit", text: "Create a post")
                }
            }.padding(.horizontal, 12)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                    }
                }
                .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                    sheetHeight = newHeight
                }
                .presentationDetents([.height(sheetHeight)])
        }.preferredColorScheme(.dark)
    }
}


// Responsive Height Sheet
struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
