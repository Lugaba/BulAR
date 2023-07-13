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
    var bula: Bula?
    
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
        self.bula = bula
        viewScreen.showMedicineDetails(bula: bula)
    }
    
    func closeModal() {
        router.closeModal()
    }
    
    func shareMedicine() {
        if let bula = self.bula {
            let text = "\(bula.nome)\n\n\(bula.indicacao)\n\n\(bula.posologia)\n\n\(bula.contraindicacao)\n\n\(bula.efeitosColaterais)\n\n\(bula.bulaCompletaURL)"
            let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        }
    }
}
