//
//  ContentView.swift
//  MySwiftUI
//
//  Created by Abdan Zaki Alifian on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            Text("Hello, Swift!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
