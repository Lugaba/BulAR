//
//  TableSearchFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

protocol MedicineDetailsInteractor {
}

protocol MedicineDetailsViewController: UITableViewController {
}

protocol MedicineDetailsRouter {
    
}

protocol MedicineDetailsView: UIView {
    
}

protocol MedicineDetailsWorker {
}

protocol MedicineDetailsPresenter {
}

public struct MedicineDetailsFactory {
    public static func makeController(bula: Bula, navigationController: UINavigationController?) -> UIViewController {
        let viewController = MedicineDetailsViewControllerImpl()

        
        let router = MedicineDetailsRouterImpl(navigationController: navigationController)
        let presenter = MedicineDetailsPresenterImpl(viewController: viewController)
        let interactor = MedicineDetailsInteractorImpl(presenter: presenter, router: router, bula: bula)
        
        viewController.interactor = interactor
        
        
        return viewController
    }
}
