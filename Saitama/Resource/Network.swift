//
//  Network.swift
//  Saitama
//
//  Created by Erik Flores on 5/18/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation
import UIKit

class Network {

    static private let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
    static private var session: URLSession = {
        return URLSession(configuration: sessionConfig)
    }()

    static func downloadImage(from url: String, completion: @escaping((_ image: UIImage) -> Void)) {
        guard let url = URL(string: url) else {
            fatalError("💥 Wrong format for the URL")
        }
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("💥 \(error)")
                return
            }
            if let data = data {
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("💥 Error with the image")
                }
            } else {
                print("💥 Error with the data")
            }
        }.resume()
    }

}
