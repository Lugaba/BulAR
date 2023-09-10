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
    func goToMainView()
}

protocol OnboardingRouter {
    func goToMainView()
}

protocol OnboardingView: UIView {

}

protocol OnboardingPresenter {

}

public struct OnboardingFactory {
    public static func makeController(navigationController: UINavigationController?, showContinueButton: Bool) -> UIViewController {
        
        let view = OnboardingViewImpl(showContinueButton: showContinueButton)
        let router = OnboardingRouterImpl(navigationController: navigationController)
        
        let viewController = OnboardingViewControllerImpl(viewScreen: view, router: router)
        
        let presenter = OnboardingPresenterImpl(viewController: viewController)
        let interactor = OnboardingInteractorImpl(presenter: presenter)
        
        viewController.interactor = interactor
        view.viewController = viewController
        
        return viewController
    }
}
