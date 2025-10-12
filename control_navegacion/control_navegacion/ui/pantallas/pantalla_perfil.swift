//
//  pantalla_perfil.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 10/10/25.
//

import SwiftUI

struct PantallaPerfilView: View {
    var usuario: Usuario
    
    var body: some View {
        ZStack {
            // azul degradado sencillo
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                // Nombre del usuario
                Text(usuario.name)
                    .font(.largeTitle)
                    .bold()
                
                // Username
                Text("Username: \(usuario.username)")
                    .font(.subheadline)
                
                // Email
                Text("Email: \(usuario.email)")
                    .font(.subheadline)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Perfil") // Título en la barra de navegación
    }
}
