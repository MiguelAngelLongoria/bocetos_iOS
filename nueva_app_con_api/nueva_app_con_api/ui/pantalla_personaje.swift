//
//  pantalla_personaje.swift
//  nueva_app_con_api
//
//  Created by Miguel Angel Longoria Granados on 29/10/25.
//

import SwiftUI

struct PantallaPersonaje: View {
   
    @Environment(DemonSlayerApp.self) var controlador
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(controlador.personajes) { personaje in
                        NavigationLink(destination: ChisteView(personaje: personaje)) {
                            TarjetaPersonaje(personaje: personaje)
                                .buttonStyle(.plain)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        colors: [Color.blue.opacity(0.5), Color.cyan],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .cornerRadius(6)
                                .padding(.horizontal)
                        }
                    }
                }
                
                Button {
                    controlador.siguiente_pagina()
                } label: {
                    Text("Siguiente página")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Personajes")
        }
    }
}

struct ChisteView: View {
    @Environment(DemonSlayerApp.self) var controlador
    let personaje: Personaje
    
    var body: some View {
        
        
        /*
        let chiste = String(describing: controlador.chiste.joke)
         */
        
        let chiste = controlador.chiste?.joke ?? "Cargando chiste..."

        
        VStack(spacing: 16) {
            Text("Pantalla del personaje \(personaje.name)")
                .font(.title2)
                .bold()
            
            Text("El chiste es:")
                .font(.headline)
            
            Text(chiste)
                .italic()
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        colors: [Color.cyan.opacity(0.7), Color.blue.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .cornerRadius(12)
                )
            
            Spacer()
        }
        .padding()
        .onAppear {
            controlador.descargar_chiste()
        }
        .navigationTitle(personaje.name)
    }
}

#Preview {
    PantallaPersonaje()
        .environment(DemonSlayerApp())
}
