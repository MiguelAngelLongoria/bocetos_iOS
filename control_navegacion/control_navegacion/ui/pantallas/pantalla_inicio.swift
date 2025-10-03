//
//  inicio.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 29/09/25.
//
import SwiftUI


struct PantallaInicio: View{
    var body: some View{
        VStack{
            Text("Bienvenidos al Himalaya")
            
            NavigationLink {
                PantallaConfiguracion()
            } label: {
                Text("Ir a pantalla configuracion")
            }
            
            NavigationLink {
                PantallaGaleria()
            } label: {
                Text("Ir a pantalla galeria")
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        PantallaInicio()
    }
}
