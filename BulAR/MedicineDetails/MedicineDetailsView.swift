//
//  MedicineDetailsView.swift
//  BulAR
//
//  Created by Luca Hummel on 24/04/23.
//

import Foundation
import UIKit

class MedicineDetailsViewImpl: UIView, MedicineDetailsView {
    var viewController: MedicineDetailsViewController?
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 8.0
        return stack
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 33)
        return label
    }()
    
    lazy var caption: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        return label
    }()
    
    lazy var indicacaoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Indicação"
        return label
    }()
    
    lazy var indicacao: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var posologiaTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Posologia"
        return label
    }()
    
    lazy var posologia: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var contraindicacaoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Contraindicação"
        return label
    }()
    
    lazy var contraindicacao: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var colateralTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Efeitos colaterais"
        return label
    }()
    
    lazy var colateral: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
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
    
    func setupHierarchy() {
        addSubview(closeButton)
        
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(nameTitle)
        stackView.addArrangedSubview(caption)
        stackView.addArrangedSubview(indicacaoTitle)
        stackView.addArrangedSubview(indicacao)
        stackView.addArrangedSubview(posologiaTitle)
        stackView.addArrangedSubview(posologia)
        stackView.addArrangedSubview(contraindicacaoTitle)
        stackView.addArrangedSubview(contraindicacao)
        stackView.addArrangedSubview(colateralTitle)
        stackView.addArrangedSubview(colateral)
    }
    
    func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: closeButton.topAnchor, constant: 32).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        indicacao.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        posologia.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        contraindicacao.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        colateral.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32).isActive = true
        
        
//        nameTitle.translatesAutoresizingMaskIntoConstraints = false
//
//        nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        nameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28).isActive = true
//        nameTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
//
//        caption.translatesAutoresizingMaskIntoConstraints = false
//
//        caption.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 4).isActive = true
//        caption.leadingAnchor.constraint(equalTo: nameTitle.leadingAnchor).isActive = true
//        caption.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
//
//        indicacao.translatesAutoresizingMaskIntoConstraints = false
//        indicacao.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 16).isActive = true
//        indicacao.trailingAnchor.constraint(equalTo: caption.trailingAnchor).isActive = true
//        indicacao.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
//        indicacao.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func showMedicineDetails(bula: Bula) {
        nameTitle.text = bula.nome
        
        var textCaption = ""
        for categoria in bula.categorias {
            textCaption += categoria.nome + ", "
        }
        caption.text = textCaption
        
        indicacao.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        posologia.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        contraindicacao.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        colateral.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }
    
    @objc
    private func closeModal() {
        viewController?.closeModal()
    }
}
