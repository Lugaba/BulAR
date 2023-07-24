//
//  ImageRecognitionPresenter.swift
//  BulAR
//
//  Created by Luca Hummel on 24/07/23.
//

import Foundation
import UIKit

class ImageRecognitionPresenterImpl: ImageRecognitionPresenter {
    private var viewController: ImageRecognitionViewController
    
    init(viewController: ImageRecognitionViewController) {
        self.viewController = viewController
    }
    
    func setRecognitionImages(list: [(UIImage, String)]) {
        viewController.setRecognitionImages(list: list)
    }
}
