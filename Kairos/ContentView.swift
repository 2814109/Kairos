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
    CheckItem(isChecked: false, taskName: "test"),]
    
    @State var isPresentedCategories = false
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
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // taskを追加する処理を組み込む
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        })
                        .frame(width: 60, height: 60)
                        .background(Color.orange)
                        .cornerRadius(30.0)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
                    }
                }
            }.fullScreenCover(isPresented: $isPresentedCategories, onDismiss: {}){
                Text("category")
                Button(action: {
                    isPresentedCategories = false
                },label: {
                    Image(systemName: "arrow.uturn.left.circle").foregroundColor(Color.yellow)
                    
                })
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
