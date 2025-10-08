//
//  ui_navegacion.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 29/09/25.
//

import SwiftUI

enum Pestañas {
    case Inicio
    case Noticias
    case Galeria
    case Configuracion
}

struct NavegacionPrincipal: View {
    @State private var pestaña_actual: Pestañas = .Inicio
    
    var body: some View {
        TabView(selection: $pestaña_actual) {
            
            // Pestaña Inicio
            NavigationStack {
                PantallaInicio()
            }
            .tabItem {
                Label("watch now", systemImage: "play.fill")
            }
            .tag(Pestañas.Inicio)
            .badge("STFU")
            
            // Pestaña Noticias
            NavigationStack {
                PantallaNoticias()
            }
            .tabItem {
                Label("noticias", systemImage: "newspaper.fill")
            }
            .tag(Pestañas.Noticias)
            .badge(5)
            
            // Pestaña Galeria
            NavigationStack {
                PantallaGaleria()
            }
            .tabItem {
                Label("Galeria", systemImage: "photo.stack")
            }
            .tag(Pestañas.Galeria)
            .badge(5)
            
            // Pestaña Configuracion
            NavigationStack {
                PantallaConfiguracion()
            }
            .tabItem {
                Label("Configuracion", systemImage: "configuration")
            }
            .tag(Pestañas.Configuracion)
            .badge(5)
        }
    }
}

#Preview {
    NavegacionPrincipal()
}
