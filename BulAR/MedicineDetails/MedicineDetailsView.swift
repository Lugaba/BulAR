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
    
    lazy var indicacao: UILabel = {
        let label = UILabel()
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
        scrollView.addSubview(contentView)
        contentView.addSubview(nameTitle)
        contentView.addSubview(caption)
        contentView.addSubview(indicacao)
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
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: indicacao.bottomAnchor).isActive = true
        
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        
        caption.translatesAutoresizingMaskIntoConstraints = false
        
        caption.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 4).isActive = true
        caption.leadingAnchor.constraint(equalTo: nameTitle.leadingAnchor).isActive = true
        caption.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        indicacao.translatesAutoresizingMaskIntoConstraints = false
        indicacao.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 16).isActive = true
        indicacao.trailingAnchor.constraint(equalTo: caption.trailingAnchor).isActive = true
        indicacao.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        indicacao.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func showMedicineDetails(bula: Bula) {
        nameTitle.text = bula.nome
        
        var textCaption = ""
        for categoria in bula.categorias {
            textCaption += categoria.nome + ", "
        }
        caption.text = textCaption
        
        indicacao.text = bula.indicacao
    }
    
    @objc
    private func closeModal() {
        viewController?.closeModal()
    }
}
