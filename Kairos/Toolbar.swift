//
//  Toolbar.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/15.
//

import SwiftUI

struct Toolbar: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("Pressed")
                        }
                        
                        Button("Second") {
                            print("Pressed")
                        }
                    }
                }
        }    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}
