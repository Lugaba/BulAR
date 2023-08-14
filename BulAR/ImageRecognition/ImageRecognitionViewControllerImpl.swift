//
//  ViewController.swift
//  BulAR
//
//  Created by Luca Hummel on 26/03/23.
//

import UIKit
import RealityKit
import ARKit

class ImageRecognitionViewControllerImpl: UIViewController {
    var router: ImageRecognitionRouter?
    var arView: ARView?
    var interactor: ImageRecognitionInteractor?
    private var listaBulas: [Bula]?
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para abrir tela de pesquisa de bulas"
        return button
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para abrir tela de bulas favoritadas"
        return button
    }()
    
    init(router: ImageRecognitionRouter? = nil, interactor: ImageRecognitionInteractor? = nil) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        arView = ARView(frame: view.bounds)
        
        guard let arView = self.arView else {
            return
        }
        
        view.addSubview(arView)
        view.addSubview(searchButton)
        view.addSubview(favoriteButton)
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        searchButton.isEnabled = false
        
        searchButton.addTarget(self, action: #selector(navigateToSearch), for: .touchUpInside)
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 16).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        favoriteButton.isEnabled = false
        
        favoriteButton.addTarget(self, action: #selector(navigateToFavorite), for: .touchUpInside)
        
        interactor?.getMedicineList(completion: { listaBula, error in
            if let listaBula = listaBula {
                self.listaBulas = listaBula
                DispatchQueue.main.sync {
                    self.searchButton.isEnabled = true
                    self.favoriteButton.isEnabled = true
                }
            }
        })
    }
    
    @objc func navigateToSearch() {
        if let listaBulas = listaBulas {
            router?.navigateToSearch(bulas: listaBulas, screenName: "Pesquisar bula")
        }
    }
    
    @objc func navigateToFavorite() {
        if let listaBulas = listaBulas, let favoritedMedicines = UserDefaults.standard.array(forKey: "favoriteList") as? [Int] {
            let bulasFiltradas = listaBulas.filter { favoritedMedicines.contains($0.id) }
            router?.navigateToSearch(bulas: bulasFiltradas, screenName: "Favoritos")
        }
    }
    
}

extension ImageRecognitionViewControllerImpl: ARSessionDelegate {
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            
            if let imageName = imageAnchor.name {
                if let bula = interactor?.getBula(url: imageName) {
                    router?.navigateToBula(bula: bula)
                }
            }
        }
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { continue }
            
            if !imageAnchor.isTracked {
                session.remove(anchor: imageAnchor)
            }
        }
    }
    
}

extension ImageRecognitionViewControllerImpl: ImageRecognitionViewController {
    func setRecognitionImages(list: [(UIImage, String)]) {
        
        var arReferenceImages = Set<ARReferenceImage>()
        
        for image in list {
            if let cgImage = image.0.cgImage {
                let physicalWidth = 0.1
                let referenceImage = ARReferenceImage(cgImage, orientation: .up, physicalWidth: CGFloat(physicalWidth))
                referenceImage.name = image.1
                arReferenceImages.insert(referenceImage)
            }
        }
        
        guard let arView = self.arView else {
            return
        }
        
        arView.session.delegate = self
        
        let configuration = ARImageTrackingConfiguration()
        
        configuration.trackingImages = arReferenceImages
        configuration.maximumNumberOfTrackedImages = arReferenceImages.count
        
        
        arView.session.run(configuration)
    }
}
