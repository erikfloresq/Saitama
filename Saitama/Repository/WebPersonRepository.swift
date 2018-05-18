//
//  WebPersonRespository.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/10/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

struct WebResultRepository: ResultRepository {
    func getAll() -> [ListDiffable] {
        return []
    }

    func get(identifier: Int) -> Result? {
        return nil
    }

    func create(a: Result) -> Bool {
        return false
    }

    func update(a: Result) -> Bool {
        return false
    }

    func delete(a: Result) -> Bool {
        return false
    }

}

