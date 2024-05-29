//
//  ContentView.swift
//  youtube
//
//  Created by Agis on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BottombarWidget()
        }.environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
}
