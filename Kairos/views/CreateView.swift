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
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    Text("check item name")
                    TextField("", text: $checkItemName).textFieldStyle(.roundedBorder)
                }.padding()
               
                VStack(alignment: .leading){
                    Text("category name")
                    TextField("", text: $checkItemName).textFieldStyle(.roundedBorder)
                    
                    Spacer()
                }.padding()
                Spacer()
                VStack{
                    Button(action: {
                        result = .save(checkItemName)
                        isPresentedCheckItem = false
                        
                    }, label: {Image(systemName: "dock.arrow.down.rectangle").resizable()
                        .frame(width: 60, height: 54).foregroundColor(checkItemName.isEmpty ? Color.gray : Color.yellow)}).disabled(checkItemName.isEmpty).padding()
                }.padding()
                
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
