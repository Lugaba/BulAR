//
//  TableSearchInteractorImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class MedicineDetailsInteractorImpl: MedicineDetailsInteractor {
    private var presenter: MedicineDetailsPresenter
    private var bula: Bula
    
    init(presenter: MedicineDetailsPresenter, bula: Bula) {
        self.presenter = presenter
        self.bula = bula
    }
    
    func showMedicineDetails() {
        presenter.showMedicineDetails(bula: self.bula)
    }
    
    func favoriteMedicine() {
        var starFilled = false
        if var favoritedMedicines = UserDefaults.standard.array(forKey: "favoriteList") as? [Int] {
            if favoritedMedicines.contains(bula.id) {
                favoritedMedicines.removeAll { $0 == bula.id}
            } else {
                favoritedMedicines.append(bula.id)
                starFilled = true
            }
            UserDefaults.standard.set(favoritedMedicines, forKey: "favoriteList")
        } else {
            UserDefaults.standard.set([bula.id], forKey: "favoriteList")
            starFilled = true
        }
        presenter.changeFavoriteButtonImage(starFilled: starFilled)
    }
}
