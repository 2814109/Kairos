//
//  classFile.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/31.
//

import Foundation
import RealmSwift

final class Todo: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var status: String = ""
    @Persisted var ownerId: String
    convenience init(name: String, ownerId: String) {
        self.init()
        self.name = name
        self.ownerId = ownerId
    }
}

/// An individual item. Part of an `ItemGroup`.
final class Item: Object, ObjectKeyIdentifiable {
    /// The unique ID of the Item. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId
    
    /// The name of the Item, By default, a random name is generated.
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
    
    /// A flag indicating whether the user "favorited" the item.
    @Persisted var isFavorite = false
    
    /// Users can enter a description, which is an empty string by default
    @Persisted var itemDescription = ""
    
    /// The backlink to the `ItemGroup` this item is a part of.
    @Persisted(originProperty: "items") var group: LinkingObjects<ItemGroup>
    
}

/// Represents a collection of items.
final class ItemGroup: Object, ObjectKeyIdentifiable {
    /// The unique ID of the ItemGroup. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId
    
    /// The collection of Items in this group.
    @Persisted var items = RealmSwift.List<Item>()
    
}
