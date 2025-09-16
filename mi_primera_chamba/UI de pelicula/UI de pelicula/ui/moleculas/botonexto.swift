import SwiftUI

struct Botonexto: View {
    var accion: () -> Void
    
    @Binding var texto: String
    var place_holder: String = "ADVERTENCIA: NO HAY CALIENTASILLAS"
    var etiqueta: String = "NO HAY ETIQUETA"
    
    var body: some View {
        HStack {
            TextField(place_holder, text: $texto)
                .frame(width: 250)
                .multilineTextAlignment(.center)
                .foregroundColor(.green) /// Texto verde
                .background(Color.black) /// Fondo negro
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.green, lineWidth: 1) /// Borde verde
                )
                .font(.system(.body, design: .monospaced)) /// Consola estilo Matrix
            
            Button(action: accion) {
                VStack {
                    Text(etiqueta)
                        .foregroundColor(.green) /// Verde
                        .font(.system(.body, design: .monospaced))
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.green) /// Verde
                }
                .padding(8)
                .background(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.green, lineWidth: 1) /// Borde verde
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var texto = ""
    
    Botonexto(accion: { print("Hola mundo") }, texto: $texto )
}


/*
 Button:

 Texto y Image con .foregroundColor(.green)

 .background(Color.black)

 .overlay(RoundedRectangle(...).stroke(Color.green))

 .font(.system(.body, design: .monospaced))
*/
