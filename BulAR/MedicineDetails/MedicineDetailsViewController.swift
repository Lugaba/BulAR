//
//  TableSearchViewControllerImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class MedicineDetailsViewControllerImpl: UITableViewController, MedicineDetailsViewController {
    var interactor: MedicineDetailsInteractor?
    var viewScreen: MedicineDetailsView
    
    init(viewScreen: MedicineDetailsView, interactor: MedicineDetailsInteractor? = nil) {
        self.interactor = interactor
        self.viewScreen = viewScreen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
