//
//  ContentView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    
  
    // DB から値を取ってくる
    @State var checkItems = [
    CheckItem(isChecked: false, taskName: "test"),
    CheckItem(isChecked: false, taskName: "test"),
    CheckItem(isChecked: false, taskName: "test"),]
    
    @State var isPresentedCategories = false
    @State var isPresentedCheckItem = false

        var body: some View {
            NavigationStack{
                VStack{
                    ForEach(checkItems.indices, id: \.self) { index in
                        CheckItemView(checkItem: $checkItems[index])
                    }
                    Spacer()
                }
                .navigationTitle("Check Items")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            isPresentedCategories = true
                        },label: {
                            Image(systemName: "note.text.badge.plus").foregroundColor(Color.yellow)

                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                        }) {
                            Image(systemName: "ellipsis.circle").foregroundColor(Color.yellow)
                        }
                    }
                }
                FABView(isPresentedCheckItem: $isPresentedCheckItem)
            }.fullScreenCover(isPresented: $isPresentedCategories, onDismiss: {}){
                ManagementCategoryView(isPresentedCategories: $isPresentedCategories)
            }
            .fullScreenCover(isPresented: $isPresentedCheckItem, onDismiss: {}){
                CreateView(isPresentedCheckItem: $isPresentedCheckItem)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
