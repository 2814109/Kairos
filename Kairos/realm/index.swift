//
//  main.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/31.
//

import Foundation
import SwiftUI
import RealmSwift

struct RealmContentView: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            LocalOnlyContentView()
        }
    }
}

struct ItemsView: View {
    @ObservedRealmObject var itemGroup: ItemGroup
    
    /// The button to be displayed on the top left.
    var leadingBarButton: AnyView?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(itemGroup.items) { item in
                        ItemRow(item: item)
                    }.onDelete(perform: $itemGroup.items.remove)
                        .onMove(perform: $itemGroup.items.move)
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Items", displayMode: .large)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: self.leadingBarButton,
                    trailing: EditButton())
                HStack {
                    Spacer()
                    Button(action: {
                        $itemGroup.items.append(Item())
                    }) { Image(systemName: "plus") }
                }.padding()
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let realm = ItemGroup.previewRealm
        let itemGroup = realm.objects(ItemGroup.self)
        ItemsView(itemGroup: itemGroup.first!)
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailsView(item: Item.item2)
        }
    }
}
