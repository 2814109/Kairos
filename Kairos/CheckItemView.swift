//
//  CheckItemView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/14.
//

import SwiftUI

struct CheckItemView: View {
    @State var checkItem = CheckItem(isChecked: false, taskName: "test")
    var body: some View {
        HStack{
            Image(systemName: checkItem.isChecked ? "checkmark.circle.fill": "checkmark.circle").resizable().frame(width: 50,height: 50)
        }
    }
}

struct CheckItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckItemView()
    }
}
