//
//  CreateView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct CreateView: View {
    @Binding var isPresentedCheckItem : Bool

    @State var checkItemName = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("", text: $checkItemName).textFieldStyle(.roundedBorder)
                Spacer()
                Button(action: {
                    isPresentedCheckItem = false
                },label: {
                    Image(systemName: "arrow.uturn.left.circle").foregroundColor(Color.yellow)
                })
            }.padding().navigationTitle("Create check Item").preferredColorScheme(.dark)
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
