//
//  OnboardingViewController.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

class OnboardingViewControllerImpl: UIViewController, OnboardingViewController {
    var interactor: OnboardingInteractor?
    private var router: OnboardingRouter
    var viewScreen: OnboardingView
    
    init(viewScreen: OnboardingView, router: OnboardingRouter, interactor: OnboardingInteractor? = nil) {
        self.interactor = interactor
        self.router = router
        self.viewScreen = viewScreen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
