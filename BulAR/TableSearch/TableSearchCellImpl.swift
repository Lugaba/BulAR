//
//  TableSearchCellImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchCellImpl: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
}
