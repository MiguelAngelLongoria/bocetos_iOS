//
//  pantalla_personajes.swift
//  nueva_app_con_api
//
//  Created by Miguel Angel Longoria Granados on 24/10/25.
//
/*
import SwiftUI

struct PantallaPersonajes: View {
    @Environment(DemonSlayerApp.self) var controlador
    
    var body: some View {
        NavigationStack { /// ///  hagarra todo lo que etsa en apntalla para que ee enveuekca en el navgiation sttck
            ScrollView { /// /// ScrollView: permite desplazarse verticalmente si hay muchos personajes
                VStack(spacing: 16) { /// ///  le agrega espacios entre lso elemetnso
                    
                    ForEach(controlador.personajes) { personaje in
                        NavigationLink(destination: DetallePersonaje(personaje: personaje)) { /// /// le agrega un clic  a cada perosanje y por ende hace que se peude regresar ala pagina 
                            VStack(spacing: 8) { /// /// VStack que agrupa la imagen y el nombre
                                
                                /// /// sirve par acaragr las iamgenes
                                AsyncImage(url: URL(string: personaje.img)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 12)) /// esquinas redondeadas
                                } placeholder: {
                                    ProgressView() /// mientras carga la imagen
                                }
                                
                                /// /// capsula azul diseño
                                Text(personaje.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    /// /// Botón de siguiente página
                    Button("Siguiente página") {
                        controlador.siguiente_pagina()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
                .padding()
            }
            .background(Color.cyan.opacity(0.3))
            .navigationTitle("Personajes") /// título de la pantalla principal
        }
    }
}


/// Vista de detalle sencilla
struct DetallePersonaje: View {
    let personaje: Personaje
    
    var body: some View {
        VStack(spacing: 20) {
            /// /// AsyncImage en detalle: imagen grande del personaje
            AsyncImage(url: URL(string: personaje.img)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
            }
            
            Text(personaje.name)
                .font(.largeTitle)
                .bold()
            
            Text(personaje.description)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationTitle(personaje.name) /// título de la pantalla de detalle
    }
}

#Preview {
    PantallaPersonajes()
        .environment(DemonSlayerApp())
}

*/

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(DemonSlayerApp.self) var controlador
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(controlador.personajes) { personaje in
                        NavigationLink {
                            VStack {
                                Text("Pantalla del personaje \(personaje.name)")
                                 
                              
                                Text("El chiste es: \(String(describing: controlador.chiste))")
                                
                               
                        
                            }
                            .onAppear {
                                controlador.descargar_chiste()
                            }
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                            colors: [Color.blue.opacity(0.5), Color.cyan], // Define los colores del degradado
                                            startPoint: .top, // Punto de inicio del degradado
                                            endPoint: .bottom // Punto final del degradado
                                        )
                                        .edgesIgnoringSafeArea(.all) // Para que el degradado cubra toda la pantalla
                                   
                            )
                            .cornerRadius(6)
                            .padding(.horizontal)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        } label: {
                            TarjetaPersonaje(personaje: personaje)
                        }
                        .buttonStyle(.plain)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                        colors: [Color.blue.opacity(0.5), Color.cyan], // Define los colores del degradado
                                        startPoint: .top, // Punto de inicio del degradado
                                        endPoint: .bottom // Punto final del degradado
                                    )
                                    .edgesIgnoringSafeArea(.all) // Para que el degradado cubra toda la pantalla
                               
                        )
                        .cornerRadius(6)
                        .padding(.horizontal)

                    }
                }
                
                Text("Siguiente página")
                    .onTapGesture {
                        controlador.siguiente_pagina()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
            }
            
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(DemonSlayerApp())
}
