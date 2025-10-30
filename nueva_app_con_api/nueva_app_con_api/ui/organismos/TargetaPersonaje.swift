//
//  organismos.swift
//  nueva_app_con_api
//
//  Created by Miguel Angel Longoria Granados on 27/10/25.
//

/*
import SwiftUI


struct TarjetaPersonaje: View {
    var personaje: Personaje
    
    var body: some View {
        AsyncImage(url: URL(string: personaje.img)){ estado in
            switch(estado){
                case .empty:
                    Text("Estamos descargando fotos")
                    .scaledToFit()
                    .padding(10)
                case .success(let imagen):
                    imagen
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                   
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                case .failure(_):
                    Text("Parece que no tienes internet")
                @unknown default:
                    Text("Esto es extraño, como lo hiciste")
            }
            
        }
            
        Text("Hola mi nombre es \(personaje.name)")
        
    }
}

#Preview {
    TarjetaPersonaje(
        personaje: Personaje(
            id: 1,
            name: "404",
            age: 34,
            gender: "No",
            race: "Angel Asesino",
            description: "no encontrada",
            img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVo82sXNSNfEN812oa2-EmKelw_EK-y0ux0A&s",
            affiliation_id: 1, arc_id: 1,
            quote: "Datos fabricados")
    )
    
}
*/

//
//  TarjetaPersonaje.swift
//  nueva_app_con_api
//
//  Created by Miguel Angel Longoria Granados on 29/10/25.
//

import SwiftUI

struct TarjetaPersonaje: View {
    var personaje: Personaje
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: personaje.img)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                ProgressView()
            }

            Text(personaje.name)
                .font(.headline)
                .foregroundColor(.white)
            
            if let age = personaje.age {
                Text("Edad: \(age)")
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Text("Género: \(personaje.gender)")
                .foregroundColor(.white.opacity(0.8))
            
            Text("Raza: \(personaje.race)")
                .foregroundColor(.white.opacity(0.8))
            
            Text("Frase: \(personaje.quote)")
                .italic()
                .foregroundColor(.yellow.opacity(0.9))
            
            Text(personaje.description)
                .font(.footnote)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.5), Color.cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

