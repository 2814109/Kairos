//
//  ContentView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack {
                Text("Hello, world!")
            }
            VStack {
                Text("Hello, world!")
            }
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Text("California")
                    .font(.caption2)
                
            }
            Button("ボタン") {
                print("ボタンが押されたよ")
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
