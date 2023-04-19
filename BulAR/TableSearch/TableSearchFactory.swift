//
//  TableSearchFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

protocol TableSearchInteractor {
    
}

protocol TableSearchViewController: UITableViewController {
    
}

protocol TableSearchRouter {
    
}

protocol TableSearchView: UIView {
    
}

protocol TableSearchWorker {
    
}

protocol TableSearchPresenter {
    
}

public struct TableSearchFactory {
    public static func makeController(navigationController: UINavigationController?) -> UIViewController {
        let view = TableSearchViewImpl()
        let worker = TableSearchWorkerImpl()
        let viewController = TableSearchViewControllerImpl(screenView: view)
        let router = TableSearchRouterImpl(navigationController: navigationController)
        let presenter = TableSearchPresenterImpl(viewController: viewController)
        let interactor = TableSearchInteractorImpl(presenter: presenter, router: router, worker: worker)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
