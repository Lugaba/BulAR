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
    private var router: MedicineDetailsRouter
    var viewScreen: MedicineDetailsView
    
    init(viewScreen: MedicineDetailsView, router: MedicineDetailsRouter, interactor: MedicineDetailsInteractor? = nil) {
        self.interactor = interactor
        self.router = router
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
        interactor?.showMedicineDetails()
    }
    
    func showMedicineDetails(bula: Bula) {
        viewScreen.showMedicineDetails(bula: bula)
    }
    
    func closeModal() {
        router.closeModal()
    }
}
