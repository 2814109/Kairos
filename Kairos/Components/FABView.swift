//
//  FABView.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct FABView: View {
    var body: some View {
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
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
            }
        }.preferredColorScheme(.dark)
    }
}

struct FABView_Previews: PreviewProvider {
    static var previews: some View {
        FABView()
    }
}
