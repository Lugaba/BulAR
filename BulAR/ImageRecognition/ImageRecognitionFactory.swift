//
//  ImageRecognitionFactory.swift
//  BulAR
//
//  Created by Luca Hummel on 26/03/23.
//

import Foundation
import UIKit

protocol ImageRecognitionRouter {
    func navigateToSearch(bulas: [Bula], screenName: String)
    func navigateToBula(bula: Bula)
}

protocol ImageRecognitionWorker {
    func fetchMedicineList(completion: @escaping ([Bula]?, Error?) -> Void)
    func fetchMedicineImage(imagesURL: [String], completion: @escaping ([(UIImage, String)]?, Error?) -> Void)
}

protocol ImageRecognitionInteractor {
    func getMedicineList(completion: @escaping ([Bula]?, Error?) -> Void)
    func getMedicineImage()
    func getBula(url: String) -> Bula?
}

protocol ImageRecognitionPresenter {
    func setRecognitionImages(list: [(UIImage, String)])
}

protocol ImageRecognitionViewController {
    func setRecognitionImages(list: [(UIImage, String)])
}

public struct ImageRecognitionFactory {
    public static func makeController(navigationController: UINavigationController?) -> UIViewController {
        
        let worker = ImageRecognitionWorkerImpl()
        
        let viewController = ImageRecognitionViewControllerImpl()
        let presenter = ImageRecognitionPresenterImpl(viewController: viewController)
        let interactor = ImageRecognitionInteractorImpl(worker: worker, presenter: presenter)


        let router = ImageRecognitionRouterImpl(navigationController: navigationController)
        
        viewController.router = router
        viewController.interactor = interactor
        
        return viewController
    }
}
