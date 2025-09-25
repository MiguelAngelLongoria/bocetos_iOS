import SwiftUI

enum Pantallas {
    case pantalla_1
    case pantalla_2
    case pantalla_3
}

struct ContentView: View {
    @State var pantalla_actual: Pantallas = .pantalla_1
    
    var body: some View {
        
        VStack {
            // Botón para cambiar pantalla
            Button("Cambiar pantalla") {
                // Lógica para cambiar pantalla
                if pantalla_actual == .pantalla_1 {
                    pantalla_actual = .pantalla_2
                } else if pantalla_actual == .pantalla_2 {
                    pantalla_actual = .pantalla_3
                } else {
                    pantalla_actual = .pantalla_1
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            // Mostrar la pantalla actual
            switch pantalla_actual {
            case .pantalla_1:
                Pantalla1()
            case .pantalla_2:
                Pantalla2()
            case .pantalla_3:
                PantallaOpciones()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ControladorBasico())
}
