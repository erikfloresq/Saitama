//
//  DemoViewModel.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/9/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import IGListKit

enum Enviroment: String {
    case local
    case debug
}

class DemoViewModel {

    private let personRepository: PersonRepository

    init() {
        guard let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String else {
            fatalError("Configuration no String")
        }
        switch Enviroment(rawValue: configuration) {
        case .local?:
            self.personRepository = LocalPersonRepository()
        case .debug?:
            self.personRepository = WebPersonRepository()
        case .none:
            self.personRepository = LocalPersonRepository()
        }
    }

    var persons: [ListDiffable] {
        return self.personRepository.getAll()
    }

}
