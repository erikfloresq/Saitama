//
//  Respository.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/10/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

protocol ResultRepository {
    func getAll() -> [ListDiffable]
    func get(identifier: Int) -> Result?
    func create(a: Result) -> Bool
    func update(a: Result) -> Bool
    func delete(a: Result) -> Bool
}
