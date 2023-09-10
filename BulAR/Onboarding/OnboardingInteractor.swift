//
//  OnboardingInteractor.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

class OnboardingInteractorImpl: OnboardingInteractor {
    private var presenter: OnboardingPresenter
    
    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
    }
    
    
}
