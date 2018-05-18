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
    // Referencia de objeto que manejará el modelo Person
    private var object: Person?

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 250)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "DemoCollectionViewCell", bundle: nil, for: self, at: index) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        Network.downloadImage(from: (object?.photo)!) { image in
            DispatchQueue.main.async {
                cell.dummyImage.image = image
            }
        }
        cell.textDescription.text = object?.name
        return cell

    }

    override func didUpdate(to object: Any) {
        guard let unwrappedObject = object as? Person else {
            return
        }
        self.object = unwrappedObject
    }
}
