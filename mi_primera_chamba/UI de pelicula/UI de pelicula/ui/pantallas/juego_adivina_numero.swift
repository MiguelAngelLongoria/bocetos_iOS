//
//  juego_adivina_numero.swift
//  mi_primera_chamba
//
//  Created by Jadzia Gallegos on 05/09/25.
//

import SwiftUI

struct JuegoAdivinaNumero: View {
    @Environment(ControlJuego.self) var juego
    @State var entrada_del_usuario: String = ""
    @State var mostrar_spoiler = false
    @State var comentario: String = ""
    @State var leyenda_advertencia = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() /// Fondo negro estilo Matrix
            
            VStack {
                Spoiler(texto: "Numero \(juego.numero_secreto)")
                    .foregroundColor(.green) /// Texto verde Matrix
                
                Spacer()
                
                Text("REGLAS")
                    .foregroundColor(.green) /// Verde
                
                Text("Cantidad de intentos: \(juego.intentos)")
                    .foregroundColor(.green) /// Verde
                
                Spacer()
                
                Botonexto(
                    accion: {
                        if juego.estado_actual != .ha_ganado {
                            comentario = juego.validar_intento(entrada_del_usuario)
                        }
                    },
                    texto: $entrada_del_usuario,
                    place_holder: "Introduce un numero",
                    etiqueta: "Intentar"
                )
                .foregroundColor(.green) /// Verde
                .padding()
                .background(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 1) /// Borde verde
                )
                
                if (juego.estado_actual == .ha_ganado) {
                    Spacer()
                    
                    Button(action: {}){
                        Text("Reiniciar juego")
                            .foregroundColor(.green) /// Verde
                    }
                }
                
                Leyenda(peligro: $leyenda_advertencia, texto: comentario)
                    .foregroundColor(.green) /// Verde
                
                Spacer()
                
                VStack {
                    RenglonColumna2(columna_1: "Nombre", columna_2: "Puntuacion")
                        .foregroundColor(.green) /// Verde
                    ForEach(jugadores_falsos) { jugador in
                        RenglonColumna2(columna_1: jugador.nombre, columna_2: "\(jugador.puntuacion)")
                            .foregroundColor(.green) /// Verde
                    }
                }
                
                Spacer()
            }
            .font(.system(.body, design: .monospaced)) /// Fuente monoespaciada estilo consola
        }
    }
}

#Preview {
    JuegoAdivinaNumero()
        .environment(ControlJuego())
}


/*
 juego_adivina_numero.swift

 Color.black.ignoresSafeArea() → Fondo negro en toda la vista.

 .foregroundColor(.green) → Todos los textos y elementos en verde Matrix.

 .font(.system(.body, design: .monospaced)) → Fuente monoespaciada tipo consola.

 .overlay(RoundedRectangle(...).stroke(Color.green)) → Bordes verdes en botones/cajas.
*/
