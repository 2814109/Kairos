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
                List {
                    Text("Category1")
                    Text("Category2")
                    Text("Category3")
                    Text("Category4")
                }
//                FABView(isPresentedCheckItem: $isPresentedCheckItem)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // categoryを追加する処理を組み込む
                            
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
