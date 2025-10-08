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
        ScrollView {
            LazyVStack {
                ForEach(controlador.publicaicones) { publicacion in
                    
                    NavigationLink {
                        //PantallaNota(noticia: noticia)
                    } label: {
                        Encabezado(publicacion: publicacion)
                    }
                    .buttonStyle(.plain)
                     
                }
            }
            .padding()
        }.onAppear{
            if controlador.publicaicones.isEmpty{Task{
                await
                controlador.descargar_publiaciones()
            }}
        }
        // Fondo agregado
        .background(
            LinearGradient(
                colors: [.blue.opacity(0.2), .white], // degradado azul a blanco
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // se extiende a toda la pantalla
        )
    }
}

#Preview {
    NavigationStack {
        PantallaNoticias()
            .environment(ControladorGeneral())
    }
}
