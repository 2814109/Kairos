//
//  ContentView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
        let vegetables = ["大根","キャベツ","じゃがいも"]
        var body: some View {
            List{
                Section(header:Text("野菜")) {
                    ForEach(0 ..< 3) { index in
                        Text(vegetables[index])
                    }
                }
                .listStyle(DefaultListStyle())
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
