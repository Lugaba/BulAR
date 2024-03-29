//
//  OnboardingRouter.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

class OnboardingRouterImpl: OnboardingRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func goToMainView() {
        let viewController = ImageRecognitionFactory.makeController(navigationController: navigationController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
