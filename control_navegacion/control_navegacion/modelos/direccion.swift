//
//  direccion.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 10/10/25.
//

import Foundation

struct Direccion: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geolocalizacion: Geolocalizacion
}
