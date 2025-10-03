//
//  pantalla_noticias.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 29/09/25.
//

import SwiftUI

struct PantallaNoticias: View {
    @State var lista_noticias = noticias
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(lista_noticias) { noticia in
                    NavigationLink {
                        PantallaNota(noticia: noticia)
                    } label: {
                        Encabezado(noticia_presentar: noticia)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
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
    }
}
