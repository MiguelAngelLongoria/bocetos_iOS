//
//  comentario.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 08/10/25.
//
import Foundation

struct Comentario: Identifiable, Codable {
    
        let postId: Int
        let id: Int
         let name: String
        let email: String
        let body: String
      
}
