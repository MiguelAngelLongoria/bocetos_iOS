//
//  boceto_02App.swift
//  boceto_02
//
//  Created by Miguel Angel Longoria Granados on 22/09/25.
//
import SwiftUI

@main
struct boceto_2App: App {
    @State var controlador = ControladorBasico()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(controlador)
        }
    }
}
