//
//  Person.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/9/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

class Person: Decodable{
    let primaryKey: Int
    let name: String
    let photo: String

    init(primaryKey: Int, name: String, photo: String){
        self.primaryKey = primaryKey
        self.name = name
        self.photo = photo
    }
}

extension Person: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return primaryKey as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? Person {
            return primaryKey == object.primaryKey
        }
        return false
    }

}
