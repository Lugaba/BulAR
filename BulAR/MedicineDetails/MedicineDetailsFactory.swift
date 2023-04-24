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
        
        let view = MedicineDetailsViewImpl()
        let viewController = MedicineDetailsViewControllerImpl(viewScreen: view)

        
        let router = MedicineDetailsRouterImpl(navigationController: navigationController)
        let presenter = MedicineDetailsPresenterImpl(viewController: viewController)
        let interactor = MedicineDetailsInteractorImpl(presenter: presenter, router: router, bula: bula)
        
        viewController.interactor = interactor
        view.viewController = viewController
        
        
        return viewController
    }
}
