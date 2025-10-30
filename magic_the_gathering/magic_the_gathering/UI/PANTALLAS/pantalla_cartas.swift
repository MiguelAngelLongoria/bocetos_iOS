//
//  pantalla_cartas.swift
//  magic_the_gathering
//
//  Created by Miguel Angel Longoria Granados on 22/10/25.
//

import SwiftUI

struct PantallaCartas: View {
    @State private var cartas: [Carta] = []
    let controlador = ControladorGeneral()
    
    var body: some View {
        NavigationView {
            List(cartas) { carta in
                HStack {
                    if let imageUrl = carta.imageUrl, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 50, height: 70)
                        .cornerRadius(5)
                    } else {
                        Color.gray.frame(width: 50, height: 70).cornerRadius(5)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(carta.name)
                            .font(.headline)
                        if let tipo = carta.type {
                            Text(tipo)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Magic: The Gathering")
        }
        .task {
            cartas = await controlador.obtenerCartas()
        }
    }
}
