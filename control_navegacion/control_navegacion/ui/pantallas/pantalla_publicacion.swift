//
//  pantall_publicacion.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 08/10/25.
//

import SwiftUI

struct PantallaPublicacion: View {
    var publicacion_actual: Publicacion
    var body: some View {
        Text("titutlo: \(publicacion_actual.title)")
        Text("\(publicacion_actual.body)")
        
        Text("Por: \(publicacion_actual.userId)")
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in {
                    Text("\(comentario)")
                }
                }
            }.onAppear{
                if controlador.comentarios.isEmpty{
                    Task{
                        await controlador.descargar_comentarios(id_publicacion: publicacion_actual.id)
                    }
                }
            }
            .onAppear {
                if !controlador.comentarios.isEmpty{
                    controlador.comentarios = []
                }
            }
        }
    }
    
#Preview {
        PantallaPublicacion(publicacion_actual: Publicacion(userId: 1, id: 1, title: "404", body: "no encontrado"))
            .environment(ControladorGeneral())
    }

