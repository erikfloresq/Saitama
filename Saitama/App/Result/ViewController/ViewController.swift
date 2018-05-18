//
//  ViewController.swift
//  Saitama
//
//  Created by Erik Flores on 5/10/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var demoCollectionView: UICollectionView!
    let viewModel = ResultViewModel()
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        adapter.dataSource = self
        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = demoCollectionView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModel.persons
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ResultSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}

