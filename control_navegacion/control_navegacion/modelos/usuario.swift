//
//  usuario.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 10/10/25.
//

import Foundation

struct Usuario: Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Direccion
}
