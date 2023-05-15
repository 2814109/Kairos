//
//  CheckItemView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/14.
//

import SwiftUI

struct CheckItemView: View {
    @Binding var checkItem : CheckItem
    
 
    var body: some View {
        HStack(spacing:16){
            Button(action:{checkItem.isChecked.toggle()}, label: {
                Image(systemName: checkItem.isChecked ?  "checkmark.circle.fill":"circlebadge").resizable().frame(width: 36,height: 36).foregroundColor(checkItem.isChecked ? Color.yellow : Color.yellow)
            })
            Text(checkItem.taskName)
            Spacer()

        }.padding().preferredColorScheme(.dark)
    }
}


private struct PreviewWrapper: View{
    @State var checkItem = CheckItem(isChecked: false, taskName: "test")
    var body: some View{
        VStack{
            CheckItemView(checkItem: $checkItem)
        }
    }
}

struct CheckItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckItemView(checkItem: .constant(CheckItem(isChecked: false, taskName: "test")))
        CheckItemView(checkItem: .constant(CheckItem(isChecked: true, taskName: "test")))
        PreviewWrapper()
    }
}
