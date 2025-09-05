//
//  juego_adivina_numero.swift
//  mi_primera_chamba
//
//  Created by Miguel Angel Longoria Granados on 05/09/25.
//

import SwiftUI

enum EstadosJuego{
    case esta_jugando
    case ha_ganado
    
}

struct JueogoAdivinaNumero: View {
    @State var entrada_del_usuario: String = ""
    @State var intento_del_usuario = 0
    @State var mostrar_spoiler = false
    @State var leyenda: String = ""
    
    @State var estado_del_juego : EstadosJuego = EstadosJuego.esta_jugando
    
    // Cambiado a State para que no se regenere con cada redibujado
    @State var numero_aleatorio = Int.random(in: 1...100)
    
    func validar_intento(){
        let numero_del_usuario = Int(entrada_del_usuario)
        
        //print("la entrada del usuairo es: \(bumero_del_usario)")
        
        if let numero_del_usuario = numero_del_usuario{
            intento_del_usuario += 1
            
            if (numero_del_usuario == numero_aleatorio){
                leyenda = "has ganado"
                estado_del_juego = .ha_ganado
            }
            else if (numero_del_usuario > numero_aleatorio){
                leyenda = "el numero es menor" // Corregido
            }
            else {
                leyenda = "el numero es mayor" // Corregido
            }
        }
        else {
             leyenda = "porfavor introduce un numero valido"
        }
    }
    
    func loop_juego(){
        switch(estado_del_juego){
        case .esta_jugando:
            validar_intento()
        case .ha_ganado:
            estado_del_juego = .esta_jugando
            numero_aleatorio = Int.random(in: 1...100)
        }
    }
    
    var body: some View {
        VStack{
            Text("SPOILER: \(mostrar_spoiler ? String(numero_aleatorio) : "???")")
                .onTapGesture {
                    mostrar_spoiler = !mostrar_spoiler
                }
                .foregroundStyle((mostrar_spoiler) ? Color.white : Color.black)
            Spacer()
            Text("REGLAS")
            Text("cantidad de intentos: \(intento_del_usuario)")
            Spacer()
            TextField("introduce un numero porfavor", text:$entrada_del_usuario)
                .frame(width: 250)
            
            // Corregido: el botón ahora ejecuta registrar_intento
            Button(action: loop_juego){
                Text("Intentar")
                Image(systemName: "paperplane.fill")
            }
            if estado_del_juego == .ha_ganado{
                Button(action: {
                    estado_del_juego = . esta_jugando
                    
                } ){
                    Text("Reinicar juego")
                }
            }
            
            Text(leyenda)
            
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

#Preview{
    JueogoAdivinaNumero()
}
