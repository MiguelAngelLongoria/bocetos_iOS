//
//  pantalla_noticias.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 29/09/25.
//

import SwiftUI

struct PantallaNoticias: View {
    @State var lista_noticias = noticias
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        if(controlador.publicaicones.isEmpty){
            Text("estamso cargando los daots, porfavor espera.")
        }
        else{
            NavigationStack
        
            ScrollView {
                LazyVStack {
                    ForEach(controlador.publicaicones) { publicacion in
                        
                        NavigationLink {
                            PantallaPublicacion(publicacion_actual: publicacion)
                            //PantallaNota(noticia: noticia)
                        } label: {
                            Encabezado(publicacion: publicacion)
                            Text("hola mundo")
                        }
                        .buttonStyle(.plain)
                        
                        )
                        )
                    }
                }
                
#Preview {
NavigationStack {
                        PantallaNoticias()
                            .environment(ControladorGeneral())
}
}
            
