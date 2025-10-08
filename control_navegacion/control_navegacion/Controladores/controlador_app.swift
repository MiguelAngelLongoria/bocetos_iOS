//
//  controlador_app.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 03/10/25.
//

import SwiftUI
import Foundation

@Observable
@MainActor
class ControladorGeneral{
    let url_base = "https://jsonplaceholder.typicode.com"
    
    var publicaicones: [Publicacion] = []
    
    func descargar_publiaciones () async  {
        guard let publiaicones_descargadas: [Publicacion] = await
                ServicioWeb().descargar_datos(url: "\(url_base)/posts") else {return}
        publicaicones = publiaicones_descargadas
    }
    
}
