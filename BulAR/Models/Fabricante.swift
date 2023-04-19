//
//  Fabricane.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation

struct Fabricante: Codable {
    var id: Int
    var nome: String
    var endereco: String
    var telefone: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nome
        case endereco
        case telefone
        case email
    }
}
