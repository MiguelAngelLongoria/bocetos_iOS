import Foundation

class ControladorGeneral {
    let servicio = ServicioWeb()
    
    func obtenerCartas() async -> [Carta] {
        // Intentar API remota
        let urlAPI = "https://api.magicthegathering.io/v1/cards"
        if let datos: RespuestaCartas = await servicio.descargar_datos(url: urlAPI) {
            return datos.cards
        }
        // Si falla, fallback JSON local
        if let datosLocales: RespuestaCartas = servicio.cargarJSONLocal(archivo: "cartas_mock") {
            return datosLocales.cards
        }
        return []
    }
}
