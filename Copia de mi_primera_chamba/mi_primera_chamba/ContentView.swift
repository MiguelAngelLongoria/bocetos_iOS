//
//  ContentView.swift
//  mi_primera_chamba
//
//  Created by Miguel Angel Longoria Granados on 03/09/25.
//

import SwiftUI

struct Pantalla: View {
    @State private var numero: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("Has pulsado \(numero) veces")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
                
                VStack(spacing: 10) {
                    Text("Hola mundo")
                    Text("Hola mundo")
                    Text("Hola mundo")
                    Text("Hola mundo")
                    Text("Hola mundo")
                    Text("Hola mundo")
                }
                .foregroundColor(.blue)
                .padding()
                
                Spacer()
            }
            .padding(.horizontal)
            
            ZStack {
                Text("Texto")
                Text("Empalado")
                    .offset(x: 0, y: 20)
            }
            .padding()
            
            .onTapGesture {
                numero += 1
            }
            
            Spacer()
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    Pantalla()
}
