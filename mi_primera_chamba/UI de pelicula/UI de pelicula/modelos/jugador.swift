import Foundation

struct Jugador: Identifiable{
    let id = UUID()
    
    let nombre: String
    let puntuacion: Int
}
let jugadores_falsos = [
    Jugador(nombre: "Pepito Pistolotes", puntuacion: 88),
    Jugador(nombre: "Lola Tronadora", puntuacion: 75),
    Jugador(nombre: "Max Destructor", puntuacion: 92),
    Jugador(nombre: "Chucho Relámpago", puntuacion: 81),
    Jugador(nombre: "Karla Centella", puntuacion: 67),
    Jugador(nombre: "Don Bigotes", puntuacion: 54),
    Jugador(nombre: "Nina Tormenta", puntuacion: 99),
    Jugador(nombre: "Rafa Meteoro", puntuacion: 73),
    Jugador(nombre: "Gloria Furia", puntuacion: 85),
    Jugador(nombre: "Tacho Bala Loca", puntuacion: 60)
]
