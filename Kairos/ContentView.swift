//
//  ContentView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    @State var checkItems = [
    CheckItem(isChecked: false, taskName: "test"),
    CheckItem(isChecked: false, taskName: "test"),]
    
        var body: some View {
            NavigationStack{
                VStack{
                    ForEach(checkItems.indices, id: \.self) { index in
                        CheckItemView(checkItem: $checkItems[index])
                    }
                    Spacer()
                }.toolbar{ToolbarItem(placement: .automatic){
                    Image(systemName: "ellipsis.circle").foregroundColor(Color.yellow)}}
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
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
                        
                    }
                }
                
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
