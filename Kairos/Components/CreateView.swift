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
                }.padding()
                Spacer()
            }.navigationTitle("Create check Item")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
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
    
    var body: some View {
        CreateView(isPresentedCheckItem: $isPresentedCheckItem)
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrappter()
        
    }
}
