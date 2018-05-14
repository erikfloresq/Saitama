//
//  Respository.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/10/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

protocol PersonRepository {
    func getAll() -> [ListDiffable]
    func get(identifier: Int) -> Person?
    func create(a: Person) -> Bool
    func update(a: Person) -> Bool
    func delete(a: Person) -> Bool
}
