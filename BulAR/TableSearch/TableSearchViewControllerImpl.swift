//
//  TableSearchViewControllerImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchViewControllerImpl: UITableViewController, TableSearchViewController {
    var interactor: TableSearchInteractor?
    private var screenView: TableSearchView
    
    init(interactor: TableSearchInteractor? = nil, screenView: TableSearchView) {
        self.interactor = interactor
        self.screenView = screenView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = screenView
    }
}
