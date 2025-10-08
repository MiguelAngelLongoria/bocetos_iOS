//
//  json_placeholder.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 06/10/25.
//
import Foundation
class ServicioWeb{
    func descargar_datos<T: Codable>(url: String) async -> T?{
        do {
            guard let url = URL(string: url) else { throw ErroresDeRed.url_mala}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.respuesta_erronea}
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.estado_negativo}
            
            guard let respuesta_decodificada = try? JSONDecoder().decode(T.self, from: datos) else {throw ErroresDeRed.falla_al_decodificar_informacion}
            return respuesta_decodificada
        }
        catch  ErroresDeRed.url_mala{
            print("porfavor escirbe alfo que se  URL")
        }
        catch ErroresDeRed.respuesta_erronea {
            print("al aprecer al servidor esta dando un stroke")
        }
        //errores de prueba
        catch ErroresDeRed.estado_negativo {
            print("al aprecer la URL que bsucars no existe o el servidor esta ocupado vuelva pronto")
        }
        catch ErroresDeRed.falla_al_decodificar_informacion {
            print("al aprecer tus esctructuras estan mas escritas, porfavor veriiva  \(type(of: T.self))")
        }
        catch {
            print("algo salio mal, y nos  eque e s.")
        }
        return nil
    }
}
