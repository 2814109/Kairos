//
//  SampleDebug.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/31.
//

import SwiftUI

struct SampleDebug: View {
    let dogs = getAllDog()
    var body: some View {
        VStack{
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                createDog()
            }    }
    }
}

struct SampleDebug_Previews: PreviewProvider {
    static var previews: some View {
        SampleDebug()
    }
}
