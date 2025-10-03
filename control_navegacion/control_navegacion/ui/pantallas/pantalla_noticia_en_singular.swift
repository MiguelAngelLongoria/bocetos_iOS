//
//  noticia_individual.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 01/10/25.
//

import SwiftUI

struct PantallaNota: View {
    @State var noticia: Noticia
    
    var body: some View {
        Spacer()
        VStack {
            Text(noticia.titular)
                .fontWeight(.bold)
                .font(.title) // tamaño de letra un poco más grande
            
            HStack {
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Text(noticia.cuerpo)
                    .font(.body) // tamaño estándar para el cuerpo
            }
            
            Spacer()
        }
        .padding()
        // Fondo  azul claro
        .background(Color.blue.opacity(0.2))
        .ignoresSafeArea() // se extiende a toda la pantalla
    }
}

#Preview {
    PantallaNota(noticia: noticias[3])
}
