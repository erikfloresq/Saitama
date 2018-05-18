//
//  LocalServer.swift
//  UrbaniaMVVM
//
//  Created by Erik Flores on 5/9/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation

struct LocalServer {
    static func getPersons(from file: String) -> [Person] {
        guard let pathJSON = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Problems with JSON URL")
        }
        do {
            let dataJSON = try Data(contentsOf: pathJSON)
            do {
                let persons = try JSONDecoder().decode([Person].self, from: dataJSON)
                return persons
            } catch {
                debugPrint(error)
                return []
            }
        } catch {
            debugPrint(error)
            return []
        }
    }
}
