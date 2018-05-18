//
//  DemoSectionController.swift
//  Saitama
//
//  Created by Erik Flores on 5/11/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit
import IGListKit

class DemoSectionController: ListSectionController {

    let viewModel = DemoViewModel()

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 250)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {

        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "DemoCollectionViewCell", bundle: nil, for: self, at: index) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let persons = viewModel.personRepository.getAll()
        if let person = persons[index] as? Person {
            Network.downloadImage(from: person.photo) { image in
                DispatchQueue.main.async {
                    cell.dummyImage.image = image
                }
            }
            cell.textDescription.text = person.name
        }
        return cell

    }

}
