import Foundation

class ServicioWeb {
    
    // Descargar desde URL remota
    func descargar_datos<T: Codable>(url: String) async -> T? {
        do {
            guard let url = URL(string: url) else { throw ErroresDeRed.url_mala }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse, (200..<300).contains(respuesta.statusCode) else {
                throw ErroresDeRed.estado_negativo
            }
            
            let decoded = try JSONDecoder().decode(T.self, from: datos)
            return decoded
            
        } catch ErroresDeRed.url_mala {
            print("Por favor, escribe una URL válida")
        } catch ErroresDeRed.respuesta_erronea {
            print("Error: respuesta del servidor no válida")
        } catch ErroresDeRed.estado_negativo {
            print("Error: servidor ocupado o URL incorrecta")
        } catch ErroresDeRed.falla_al_decodificar_informacion {
            print("Error al decodificar la información para tipo \(T.self)")
        } catch {
            print("Error desconocido: \(error)")
        }
        
        return nil
    }
    
    // Cargar JSON local (fallback)
    func cargarJSONLocal<T: Codable>(archivo: String) -> T? {
        guard let path = Bundle.main.path(forResource: archivo, ofType: "json") else {
            print("No se encontró el archivo JSON local: \(archivo)")
            return nil
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            print("Error al decodificar JSON local: \(error)")
            return nil
        }
    }
}
