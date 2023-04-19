//
//  Categoria.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation

struct Categoria: Codable {
    var id: Int
    var nome: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nome
    }
}
