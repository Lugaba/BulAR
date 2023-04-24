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
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
