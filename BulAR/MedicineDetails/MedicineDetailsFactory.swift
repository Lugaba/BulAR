//
//  TableSearchFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

protocol MedicineDetailsInteractor {
    func showMedicineDetails()
    func favoriteMedicine()
}

protocol MedicineDetailsViewController: UIViewController {
    func showMedicineDetails(bula: Bula)
    func closeModal()
    func shareMedicine()
    func favoriteMedicine()
    func changeFavoriteButtonImage(starFilled: Bool)
}

protocol MedicineDetailsRouter {
    func closeModal()
}

protocol MedicineDetailsView: UIView {
    func showMedicineDetails(bula: Bula)
    func changeFavoriteButtonImage(starFilled: Bool)
}

protocol MedicineDetailsWorker {
}

protocol MedicineDetailsPresenter {
    func showMedicineDetails(bula: Bula)
    func changeFavoriteButtonImage(starFilled: Bool)
}

public struct MedicineDetailsFactory {
    public static func makeController(bula: Bula, navigationController: UINavigationController?) -> UIViewController {
        
        let view = MedicineDetailsViewImpl()
        let router = MedicineDetailsRouterImpl(navigationController: navigationController)
        
        let viewController = MedicineDetailsViewControllerImpl(viewScreen: view, router: router)
        
        let presenter = MedicineDetailsPresenterImpl(viewController: viewController)
        let interactor = MedicineDetailsInteractorImpl(presenter: presenter, bula: bula)
        
        viewController.interactor = interactor
        view.viewController = viewController
        
        return viewController
    }
}
