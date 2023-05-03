//
//  TableSearchFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

protocol TableSearchInteractor {
    func getMedicineList()
    func getMedicineImage(imageURL: String, completion: @escaping (UIImage) -> Void)
}

protocol TableSearchViewController: UITableViewController {
    func showMedicineList(list: [Bula])
}

protocol TableSearchRouter {
    func goToMedicineDetails(bula: Bula)
}

protocol TableSearchView: UIView {
    
}

protocol TableSearchWorker {
    func fetchMedicineList(completion: @escaping ([Bula]?, Error?) -> Void)
    func fetchMedicineImage(imageURL: String, completion: @escaping (UIImage?, Error?) -> Void)
}

protocol TableSearchPresenter {
    func showMedicineList(list: [Bula])
}

public struct TableSearchFactory {
    public static func makeController() -> UIViewController {
        let worker = TableSearchWorkerImpl()
        
        let viewController = TableSearchViewControllerImpl()

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let router = TableSearchRouterImpl(navigationController: navigationController)

        
        let presenter = TableSearchPresenterImpl(viewController: viewController)
        let interactor = TableSearchInteractorImpl(presenter: presenter, worker: worker)
        
        viewController.interactor = interactor
        viewController.router = router
        
        
        return navigationController
    }
}
