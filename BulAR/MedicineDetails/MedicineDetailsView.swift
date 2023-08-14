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
    var bulaUrl = ""
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.tintColor = .lightGray
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para fechar bula"
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var caption: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var indicacaoTitle: UILabel = {
        let label = UILabel()
        label.text = "Para que este medicamento é indicado?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var indicacao: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var posologiaTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Como devo usar este medicamento?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var posologia: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var contraindicacaoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Quando não devo usar este medicamento?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var contraindicacao: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var colateralTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Quais os males que este medicamento pode causar?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var colateral: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var fabricanteTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Fabricante"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var fabricante: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var bulaCompleta: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Ver bula completa", for: .normal)
        button.addTarget(self, action: #selector(openUrlSafari), for: .touchUpInside)
        button.tintColor = .white
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para abrir bula completa na internet"
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.addTarget(self, action: #selector(shareMedicine), for: .touchUpInside)
        button.tintColor = .black
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para compartilhar bula"
        return button
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.addTarget(self, action: #selector(favoriteMedicine), for: .touchUpInside)
        button.tintColor = .black
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Botão para favoritar bula"
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
    
    func setupHierarchy() {
        addSubview(closeButton)
        addSubview(shareButton)
        addSubview(favoriteButton)
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameTitle)
        contentView.addSubview(caption)
        contentView.addSubview(indicacaoTitle)
        contentView.addSubview(indicacao)
        contentView.addSubview(posologiaTitle)
        contentView.addSubview(posologia)
        contentView.addSubview(contraindicacaoTitle)
        contentView.addSubview(contraindicacao)
        contentView.addSubview(colateralTitle)
        contentView.addSubview(colateral)
        contentView.addSubview(fabricanteTitle)
        contentView.addSubview(fabricante)
        contentView.addSubview(bulaCompleta)
    }
    
    func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.centerYAnchor.constraint(equalTo: shareButton.centerYAnchor).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -8).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: closeButton.topAnchor, constant: 32).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bulaCompleta.bottomAnchor).isActive = true
    
        
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        caption.translatesAutoresizingMaskIntoConstraints = false
        
        caption.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 4).isActive = true
        caption.leadingAnchor.constraint(equalTo: nameTitle.leadingAnchor).isActive = true
        caption.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        indicacaoTitle.translatesAutoresizingMaskIntoConstraints = false
        
        indicacaoTitle.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 16).isActive = true
        indicacaoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        indicacaoTitle.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        indicacao.translatesAutoresizingMaskIntoConstraints = false
        
        indicacao.topAnchor.constraint(equalTo: indicacaoTitle.bottomAnchor, constant: 4).isActive = true
        indicacao.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        indicacao.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        posologiaTitle.translatesAutoresizingMaskIntoConstraints = false
        posologiaTitle.topAnchor.constraint(equalTo: indicacao.bottomAnchor, constant: 16).isActive = true
        posologiaTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        posologiaTitle.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        posologia.translatesAutoresizingMaskIntoConstraints = false
        posologia.topAnchor.constraint(equalTo: posologiaTitle.bottomAnchor, constant: 4).isActive = true
        posologia.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        posologia.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contraindicacaoTitle.translatesAutoresizingMaskIntoConstraints = false
        contraindicacaoTitle.topAnchor.constraint(equalTo: posologia.bottomAnchor, constant: 16).isActive = true
        contraindicacaoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contraindicacaoTitle.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        contraindicacao.translatesAutoresizingMaskIntoConstraints = false
        contraindicacao.topAnchor.constraint(equalTo: contraindicacaoTitle.bottomAnchor, constant: 4).isActive = true
        contraindicacao.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contraindicacao.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        colateralTitle.translatesAutoresizingMaskIntoConstraints = false
        colateralTitle.topAnchor.constraint(equalTo: contraindicacao.bottomAnchor, constant: 16).isActive = true
        colateralTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        colateralTitle.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        colateral.translatesAutoresizingMaskIntoConstraints = false
        colateral.topAnchor.constraint(equalTo: colateralTitle.bottomAnchor, constant: 4).isActive = true
        colateral.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        colateral.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        fabricanteTitle.translatesAutoresizingMaskIntoConstraints = false
        fabricanteTitle.topAnchor.constraint(equalTo: colateral.bottomAnchor, constant: 16).isActive = true
        fabricanteTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        fabricanteTitle.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        
        fabricante.translatesAutoresizingMaskIntoConstraints = false
        fabricante.topAnchor.constraint(equalTo: fabricanteTitle.bottomAnchor, constant: 4).isActive = true
        fabricante.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        fabricante.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        bulaCompleta.translatesAutoresizingMaskIntoConstraints = false
        bulaCompleta.topAnchor.constraint(equalTo: fabricante.bottomAnchor, constant: 24).isActive = true
        bulaCompleta.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        bulaCompleta.trailingAnchor.constraint(equalTo: nameTitle.trailingAnchor).isActive = true
        bulaCompleta.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        bulaCompleta.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
    }
    
    func showMedicineDetails(bula: Bula) {
        if let favoritedMedicines = UserDefaults.standard.array(forKey: "favoriteList") as? [Int], favoritedMedicines.contains(bula.id) {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        nameTitle.text = bula.nome
        
        var textCaption = ""
        for index in 0..<bula.categorias.count {
            textCaption += bula.categorias[index].nome
            if index < bula.categorias.count-1 {
                textCaption += ", "
            }
        }
        caption.text = textCaption
        
        indicacao.text = bula.indicacao
        posologia.text = bula.posologia
        contraindicacao.text = bula.contraindicacao
        colateral.text = bula.efeitosColaterais
        bulaUrl = bula.bulaCompletaURL
        
        fabricante.text = "\(bula.fabricante.nome)\n\(bula.fabricante.endereco)\n\(bula.fabricante.email)\n\(bula.fabricante.telefone)"
    }
    
    @objc
    private func closeModal() {
        viewController?.closeModal()
    }
    
     @objc
    private func shareMedicine() {
        viewController?.shareMedicine()
    }
    
    @objc
   private func favoriteMedicine() {
       viewController?.favoriteMedicine()
   }
    
    @objc func openUrlSafari() {
        if let url = URL(string: bulaUrl) {
            UIApplication.shared.open(url)
        }
    }
    
    func changeFavoriteButtonImage(starFilled: Bool) {
        if starFilled {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
