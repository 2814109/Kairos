//
//  sampleModel.swift
//  Kairos
//
//  Created by kyosuke on 2023/05/31.
//

import Foundation
import RealmSwift

class DogToy: Object {
    @Persisted var name = ""
}
class Dog: Object {
    @Persisted var name = ""
    @Persisted var age = 0
    @Persisted var color = ""
    @Persisted var currentCity = ""
    @Persisted var citiesVisited: MutableSet<String>
    @Persisted var companion: AnyRealmValue
    // To-one relationship
    @Persisted var favoriteToy: DogToy?
    // Map of city name -> favorite park in that city
    @Persisted var favoriteParksByCity: Map<String, String>
}
class Person: Object {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var name = ""
    // To-many relationship - a person can have many dogs
    @Persisted var dogs: List<Dog>
    // Embed a single object.
    // Embedded object properties must be marked optional.
    @Persisted var address: Address?
    convenience init(name: String, address: Address) {
        self.init()
        self.name = name
        self.address = address
    }
}
class Address: EmbeddedObject {
    @Persisted var street: String?
    @Persisted var city: String?
    @Persisted var country: String?
    @Persisted var postalCode: String?
}
// Instantiate the class and set its values.

func createDog() -> Void{
    let dog = Dog()
    dog.name = "Rex"
    dog.age = 10
    // Get the default realm. You only need to do this once per thread.
    let realm = try! Realm()
    // Open a thread-safe transaction.
    try! realm.write {
        // Add the instance to the realm.
        realm.add(dog)
    }
    
}
