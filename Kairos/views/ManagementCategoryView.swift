//
//  ManagementCategoryView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct ManagementCategoryView: View {
    @Binding var isPresentedCategories:Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("category")
            }.navigationTitle("Management Category")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            isPresentedCategories = false
                        },label: {
                            Image(systemName: "arrow.uturn.left.circle").foregroundColor(Color.yellow)
                        })
                    }
                }.padding().preferredColorScheme(.dark)
            
        }
        
    }
}

private struct PreviewWrappter : View{
    @State var isPresentedCategories = false
    
    var body: some View {
        ManagementCategoryView(isPresentedCategories: $isPresentedCategories)
    }
}
struct ManagementCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrappter()
    
    }
}
