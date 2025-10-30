//
//  carta.swift
//  magic_the_gathering
//
//  Created by Miguel Angel Longoria Granados on 22/10/25.
//

import Foundation

struct Carta: Identifiable, Codable {
    let id: String
    let name: String
    let type: String?
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case imageUrl
    }
}

struct RespuestaCartas: Codable {
    let cards: [Carta]
}
