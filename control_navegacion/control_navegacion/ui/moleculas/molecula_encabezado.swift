
import SwiftUI


struct Encabezado: View {
    var noticia_presentar: Noticia = Noticia(
        titular: "404", cuerpo: "No encontrado", imagen: "imagen_chida", prioridad: .importante
    )
    
    var body: some View {
        HStack(spacing: 10){
            Image(noticia_presentar.imagen)
            
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape( Capsule() )
            
            VStack{
                HStack{
                    Text(noticia_presentar.titular)
                        .lineLimit(1)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red)
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    Text(noticia_presentar.cuerpo)
                        .lineLimit(2)
                    Spacer()
                }
            }
        }
        /*
        .frame(height: 80)
        .padding(10)
        .background{
            Rectangle()
                .foregroundStyle(Color.blue)
                .cornerRadius(10)
                //.padding(-10)
        }
        .padding(5)
         */
        .frame(height: 80)
        .padding(10)
        .background{
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .blue, location: 0),
                            .init(color: .cyan, location: 0.5),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .padding(5)

        
    }
}

#Preview {
    Encabezado()
}
