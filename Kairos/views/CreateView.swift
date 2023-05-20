//
//  CreateView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct CreateView: View {
    enum Result {
        case save(String)
        case cancel
    }
    
    @Binding var isPresentedCheckItem : Bool
    @Binding var result : Result

    @State var checkItemName = ""
    @State private var selectedValue = "りんご"

    var body: some View {
        VStack {
            NavigationStack{
                VStack{
                    VStack(alignment: .leading){
                        Text("check item name")
                        TextField("", text: $checkItemName).textFieldStyle(.roundedBorder)
                    }.padding()
                    
                   
                    VStack(alignment: .leading){
                        Text("category name")
                        Picker("", selection: $selectedValue) {
                            Text("りんご").tag(0)
                            Text("みかん").tag(1)
                            Text("レモン").tag(2)
                            Text("ゴリラ").tag(1)
                            Text("ラッパ").tag(2)
                            Text("パクチー").tag(1)
                            Text("チーズ").tag(2)
                        }
                        .pickerStyle(.wheel)
                        
                        Spacer()
                    }.padding()
                    Spacer()
                }.navigationTitle("Create check Item")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {
                                result = .cancel
                                isPresentedCheckItem = false
                            },label: {
                                Image(systemName: "arrow.uturn.left.circle").foregroundColor(Color.yellow)
                            })
                        }
                    }.padding().preferredColorScheme(.dark)
            }
            Button(action: {
                result = .save(checkItemName)
                isPresentedCheckItem = false
                
            }, label: {Image(systemName: "dock.arrow.down.rectangle").resizable()
                .frame(width: 60, height: 54).foregroundColor(checkItemName.isEmpty ? Color.gray : Color.yellow)}).disabled(checkItemName.isEmpty).padding()        }
    }
}

private struct PreviewWrappter :View{
    @State var isPresentedCheckItem = false
    @State var result = CreateView.Result.cancel
    
    var body: some View {
        CreateView(isPresentedCheckItem: $isPresentedCheckItem, result: $result)
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrappter()
        
    }
}
