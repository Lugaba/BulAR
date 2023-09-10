//
//  OnboardingPresenter.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

class OnboardingPresenterImpl: OnboardingPresenter {
    
    private var viewController: OnboardingViewController
    
    init(viewController: OnboardingViewController) {
        self.viewController = viewController
    }
}
