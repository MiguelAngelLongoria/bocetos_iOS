//
//  ContentView.swift
//  mi_primera_chamba
//
//  Created by Miguel Angel Longoria Granados on 03/09/25.
//

import SwiftUI

struct Pantalla: View {
    var body: some View {
        HStack{
            Text("hola mundo")
                .foregroundStyle(Color.white)
                .background(Color.red)
                .padding()
            Text("hola mundo")
            Text("hola mundo")
                
                .foregroundStyle(Color.blue)
                .padding()
                .background(Color.red)
                
            Text("hola mundo")
            Text("hola mundo")
                .padding()
                .foregroundStyle(Color.blue)
                .background(Color.red)
            Text("hola mundo")
            
            VStack{
                Text("hola mundo")
                Text("hola mundo")
                Text("hola mundo")
                Text("hola mundo")
                Text("hola mundo")
                Text("hola mundo")
            }
            Spacer()
            
            ZStack{
                Text("texto")
                Text("empaldo ")
                
            }
            Spacer()
        }
        
        
        
        
    }
}

#Preview {
    Pantalla()
}
