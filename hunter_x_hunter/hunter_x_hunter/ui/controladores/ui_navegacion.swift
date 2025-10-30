
//
//  ui_navegacion.swift
//  hunter_x_hunter
//
//  Created by Miguel Angel Longoria Granados on 22/10/25.
//

//
//  ui_navegacion.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//

import SwiftUI


enum Pestañas{
    case Configuracion
    case Galeria
    case Noticias
    case Inicio
}

struct NavegacionPrincipal: View {
    @State var pestaña_actual: Pestañas = .Inicio
    
    var body: some View {
        TabView(selection: $pestaña_actual){
            Tab("Watch Now", systemImage: "play", value: .Inicio){
                PantallaInicio()
            }
            .badge("STFU")
            
            Tab("Noticias", systemImage: "newspaper", value: .Noticias){
                PantallaNoticias()
            }
            .badge(noticias.count)
        }
    }
}


#Preview {
    NavegacionPrincipal()
}
