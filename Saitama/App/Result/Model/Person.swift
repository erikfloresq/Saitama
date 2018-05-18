//
//  Person.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/9/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

class Result: Decodable {
    let primaryKey: Int
    let name: String
    let photo: String

    init(primaryKey: Int, name: String, photo: String){
        self.primaryKey = primaryKey
        self.name = name
        self.photo = photo
    }
}


extension Result: ListDiffable {
    /*
     * diffIdentifier retornamos la id único de cada registro,
     * En caso exista un registro que tenga el mismo id no será mostrado
     * visualmente
     */
    func diffIdentifier() -> NSObjectProtocol {
        return primaryKey as NSObjectProtocol
    }

    // TODO
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true
        }
        guard let unwrappedObject = object as? Result else {
            return false
        }
        return name == unwrappedObject.name
    }
}
