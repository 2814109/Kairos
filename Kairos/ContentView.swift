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
    CheckItem(isChecked: true, taskName: "test"),
    CheckItem(isChecked: false, taskName: "test"),]
    
    @State var isPresentedCategories = false
    @State var isPresentedCheckItem = false
    @State var createViewResult = CreateView.Result.cancel

    @State var isDisplayed = false
    func didDismiss() -> Void{
        switch createViewResult {
            case .save(let checkItemName):
                checkItems.append(CheckItem(isChecked: false, taskName: checkItemName))
            case .cancel:
                break
        }
    }
    
        var body: some View {
            NavigationStack{
                VStack{
                    ForEach(checkItems.indices, id: \.self) { index in
                        if($checkItems[index].isChecked.wrappedValue == isDisplayed){
                            CheckItemView(checkItem: $checkItems[index])
                        }
                            
                        
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
                            Image(systemName: "plus.square.on.square").foregroundColor(Color.yellow)

                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Menu() {
                            Button(!isDisplayed ? "実行済みを表示" : "未実行を表示",action:{
                                isDisplayed = !isDisplayed
                            })
                            Button("カテゴリーを編集",action:{
                                isPresentedCategories = true
                            })
                        }label: {
                            Image(systemName: "ellipsis.circle").foregroundColor(Color.yellow)
                        }
                    }
                }
                FABView(isPresentedCheckItem: $isPresentedCheckItem)
            }.fullScreenCover(isPresented: $isPresentedCategories, onDismiss: {}){
                ManagementCategoryView(isPresentedCategories: $isPresentedCategories)
            }
            .fullScreenCover(isPresented: $isPresentedCheckItem, onDismiss: {
                didDismiss()
            }){
                CreateView(isPresentedCheckItem: $isPresentedCheckItem,
                result: $createViewResult)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
