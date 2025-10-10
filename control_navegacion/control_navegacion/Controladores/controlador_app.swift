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
    
    var publicaciones: [Publicacion] = []
    var comentarios: [Comentario] = []
    
    var _publicacion_actual: Int? = nil
    
    init(){
        Task{
            await descargar_publiaciones()
        }
    }
    
    func descargar_publiaciones () async  {
        guard let publicaciones_descargadas: [Publicacion] = await
                ServicioWeb().descargar_datos(url: "\(url_base)/posts") else {return}
        publicacicones = publicaciones_descargadas
        
        #if targetEnvironment(simulator)
        try? await Task.sleep(for: .seconds(2))
        #endif
    }
   
    private func _descargar_comentarios(id_publicacion: Int) async {
        guard let comentarios_descargados: [Comentario] = await
                ServicioWeb().descargar_datos(url: "\(url_base)/posts/\(id_publicacion)/comments") else {return}
        comentarios = comentarios_descargados
        
    }
    
    func descargar_comentarios(id_publicacion: Int) {
        Task{
            await _descargar_comentarios(id_publicacion: id_publicacion)
        }
    }
    func publicacion_seleccioanda(_ id: Int){
        for publicacion in publicaciones{
            if publicacion.id == id{
                _publicacion_actual = publicacion
                break
            }
        }
        _descargar_comentarios(id_publicacion: _publicacion_actual?.id ?? 0)
    }
}
