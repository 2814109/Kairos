//
//  CreateView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct CreateView: View {
    @State var checkItemName = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("", text: $checkItemName).textFieldStyle(.roundedBorder)
                Spacer()
            }.padding().navigationTitle("Create check Item").preferredColorScheme(.dark)
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
