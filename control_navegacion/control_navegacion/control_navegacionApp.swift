//
//  ContentView.swift
//  control_navegacion
//
//  Created by Miguel Angel Longoria Granados on 29/09/25.
//

import SwiftUI

@main
struct control_navegacionApp: App {
    @State var contorlador_app = ControladorGeneral()
    var body: some Scene {
        WindowGroup {
            NavegacionPrincipal()
                .environment(contorlador_app)
        }
    }
}
