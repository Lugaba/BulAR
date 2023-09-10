//
//  OnboardingFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

protocol OnboardingInteractor {

}

protocol OnboardingViewController: UIViewController {

}

protocol OnboardingRouter {
    
}

protocol OnboardingView: UIView {

}

protocol OnboardingPresenter {

}

public struct OnboardingFactory {
    public static func makeController(navigationController: UINavigationController?) -> UIViewController {
        
        let view = OnboardingViewImpl()
        let router = OnboardingRouterImpl(navigationController: navigationController)
        
        let viewController = OnboardingViewControllerImpl(viewScreen: view, router: router)
        
        let presenter = OnboardingPresenterImpl(viewController: viewController)
        let interactor = OnboardingInteractorImpl(presenter: presenter)
        
        viewController.interactor = interactor
        view.viewController = viewController
        
        return viewController
    }
}
