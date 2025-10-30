//
//  personaje.swift
//  hunter_x_hunter
//
//  Created by Miguel Angel Longoria Granados on 22/10/25.
//

import Foundation

struct Personaje: Identifiable, Codable {
    let id: Int
    let nombre: String
    let imagen: String
    let habilidad: String
}

struct RespuestaPersonajes: Codable {
    let personajes: [Personaje]
}
