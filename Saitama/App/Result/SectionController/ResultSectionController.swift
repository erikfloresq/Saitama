//
//  DemoSectionController.swift
//  Saitama
//
//  Created by Erik Flores on 5/11/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit
import IGListKit

class ResultSectionController: ListSectionController {
    private var object: Result?

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (collectionContext?.containerSize.width)!, height: 250)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "ResultCollectionViewCell", bundle: nil, for: self, at: index) as? ResultCollectionViewCell else {
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
        guard let unwrappedObject = object as? Result else {
            return
        }
        self.object = unwrappedObject
    }
}
