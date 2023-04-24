//
//  Bula.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation

public struct Bula: Codable {
    var id: Int
    var nome: String
    var indicacao: String
    var posologia: String
    var contraindicacao: String
    var efeitosColaterais: String
    var imagesURL: [String]
    var bulaCompletaURL: String
    var fabricante: Fabricante
    var categorias: [Categoria]
    
    enum CodingKeys: String, CodingKey {
        case id
        case nome
        case indicacao
        case posologia
        case contraindicacao
        case efeitosColaterais
        case imagesURL
        case bulaCompletaURL
        case fabricante
        case categorias
    }
}
