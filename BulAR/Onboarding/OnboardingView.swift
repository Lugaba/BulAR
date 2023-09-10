//
//  OnboardingView.swift
//  BulAR
//
//  Created by Luca Hummel on 10/09/23.
//

import Foundation
import UIKit

class OnboardingViewImpl: UIView, OnboardingView {
    var viewController: OnboardingViewController?
    
    lazy var welcomeTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.text = "Bem-vindo"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var cameraImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "iphone.rear.camera"))
        image.tintColor = .white
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var cameraLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Aponte a camêra do celular para a embalagem do medicamento."
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var medicineImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "pill"))
        image.tintColor = .white
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var medicineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Consulte a bula do medicamento"
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var favoriteImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "star"))
        image.tintColor = .white
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Favorite bulas para agilizar o acesso"
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var shareImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        image.tintColor = .white
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var shareLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Compartilhe a bula com outras pessoas"
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Continuar", for: .normal)
        button.addTarget(self, action: #selector(showWarning), for: .touchUpInside)
        button.tintColor = .white
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para mudar de tela e fechar dicas"
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showWarning() {
        print("war")
    }
    
    func setupHierarchy() {
        self.addSubview(welcomeTitle)
        self.addSubview(cameraImage)
        self.addSubview(cameraLabel)
        self.addSubview(medicineImage)
        self.addSubview(medicineLabel)
        self.addSubview(favoriteImage)
        self.addSubview(favoriteLabel)
        self.addSubview(shareImage)
        self.addSubview(shareLabel)
        self.addSubview(continueButton)
    }
    
    func setupConstraints() {
        welcomeTitle.translatesAutoresizingMaskIntoConstraints = false
        welcomeTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        welcomeTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        cameraImage.translatesAutoresizingMaskIntoConstraints = false
        cameraImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cameraImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cameraImage.topAnchor.constraint(equalTo: self.welcomeTitle.bottomAnchor, constant: 32).isActive = true
        cameraImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        
        cameraLabel.translatesAutoresizingMaskIntoConstraints = false
        cameraLabel.centerYAnchor.constraint(equalTo: cameraImage.centerYAnchor).isActive = true
        cameraLabel.leadingAnchor.constraint(equalTo: cameraImage.trailingAnchor, constant: 16).isActive = true
        cameraLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        medicineImage.translatesAutoresizingMaskIntoConstraints = false
        medicineImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        medicineImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        medicineImage.topAnchor.constraint(equalTo: self.cameraImage.bottomAnchor, constant: 24).isActive = true
        medicineImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        
        medicineLabel.translatesAutoresizingMaskIntoConstraints = false
        medicineLabel.centerYAnchor.constraint(equalTo: medicineImage.centerYAnchor).isActive = true
        medicineLabel.leadingAnchor.constraint(equalTo: medicineImage.trailingAnchor, constant: 16).isActive = true
        medicineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        favoriteImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        favoriteImage.topAnchor.constraint(equalTo: self.medicineImage.bottomAnchor, constant: 24).isActive = true
        favoriteImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.centerYAnchor.constraint(equalTo: favoriteImage.centerYAnchor).isActive = true
        favoriteLabel.leadingAnchor.constraint(equalTo: favoriteImage.trailingAnchor, constant: 16).isActive = true
        favoriteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        shareImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        shareImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        shareImage.topAnchor.constraint(equalTo: self.favoriteImage.bottomAnchor, constant: 24).isActive = true
        shareImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        shareLabel.centerYAnchor.constraint(equalTo: shareImage.centerYAnchor).isActive = true
        shareLabel.leadingAnchor.constraint(equalTo: shareImage.trailingAnchor, constant: 16).isActive = true
        shareLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
    }
    
    
}
