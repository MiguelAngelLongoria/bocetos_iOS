//
//  errores.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 06/10/25.
//

enum ErroresDeRed: Error{
    case url_mala //que hay un direccion mal escrita
    case peticion_invalida // error en la peticion http
    case respuesta_erronea // losdatos recibidos son incorrectos
    case estado_negativo // algo difernete al StatusCode: 200 de HTTP
    case falla_al_decodificar_informacion // la cajetie añlk escribir el modelo
}
