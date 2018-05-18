//
//  LocalData.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/10/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

struct LocalPersonRepository: PersonRepository {
    func getAll() -> [ListDiffable] {
        return LocalServer.getPersons(from: "Persons")
    }

    func get(identifier: Int) -> Person? {
        return nil
    }

    func create(a: Person) -> Bool {
        return false
    }

    func update(a: Person) -> Bool {
        return false
    }

    func delete(a: Person) -> Bool {
        return false
    }

}
