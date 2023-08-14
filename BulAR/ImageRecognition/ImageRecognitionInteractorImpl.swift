//
//  ImageRecognitionInteractor.swift
//  BulAR
//
//  Created by Luca Hummel on 24/07/23.
//

import Foundation
import UIKit

class ImageRecognitionInteractorImpl: ImageRecognitionInteractor {

    
    let imageCash = GlobalCache.shared
    private var worker: ImageRecognitionWorker
    private var presenter: ImageRecognitionPresenter

    private var bulas: [Bula] = []

    init(worker: ImageRecognitionWorker, presenter: ImageRecognitionPresenter) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func getMedicineList(completion: @escaping ([Bula]?, Error?) -> Void) {
        worker.fetchMedicineList { bulas, error in
            if let bulas = bulas {
                self.bulas = bulas
                self.getMedicineImage()
                completion(bulas, nil)
            } else {
                print(error)
                completion(nil, error)
            }
        }
    }
    
    func getMedicineImage() {
        var urls: [String] = []
        
        for bula in bulas {
            for url in bula.imagesURL {
                urls.append(url)
            }
        }
        
        worker.fetchMedicineImage(imagesURL: urls) { response, error in
            if let response = response {
                var images: [UIImage] = []
                for item in response {
                    images.append(item.0)
                    self.imageCash.setObject(item.0, forKey: item.1)
                }
                self.presenter.setRecognitionImages(list: response)
            }
        }
    }
    
    func getBula(url: String) -> Bula? {
        if let bula = bulas.first(where: { $0.imagesURL.contains(url) }) {
            return bula
        } else {
            return nil
        }
    }
}
