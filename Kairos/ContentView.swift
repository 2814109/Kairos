//
//  ContentView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    @State var checkItems = [
    CheckItem(isChecked: false, taskName: "test"),
    CheckItem(isChecked: false, taskName: "test"),]
        var body: some View {
            VStack{
                
                ForEach(checkItems.indices, id: \.self) { index in
                    CheckItemView(checkItem: $checkItems[index])
                }
            }
            .listStyle(DefaultListStyle())
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
