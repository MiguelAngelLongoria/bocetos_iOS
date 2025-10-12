import SwiftUI

struct PantallaPublicacion: View {
    @Environment(ControladorGeneral.self) var controlador
    var publicacion_actual: Publicacion
    
    var body: some View {
        ZStack {
            // Fondo azul derado
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)]), // color de fondo
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Título de la publicación
                    Text(publicacion_actual.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.indigo)
                    
                    // publicación
                    Text(publicacion_actual.body)
                        .font(.body)
                        .foregroundColor(.blue) // Texto del fondo
                    
                    // Nombre del usuario que publicó
                    if let usuario = controlador.obtener_usuario_por_id(publicacion_actual.userId) {
                        NavigationLink(destination: PantallaPerfil(usuario: usuario)) {
                            Text("Por: \(usuario.name)")
                                .font(.subheadline)
                                .foregroundColor(.cyan) // C
                        }
                    } else {
                        Text("Por: Usuario #\(publicacion_actual.userId)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    // Divider con color azul
                    Divider()
                    //color de divider
                        .frame(height: 2)
                        .background(Color.blue.opacity(0.5))
                    
                    // Lista de comentarios
                    Text("Comentarios:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(controlador.comentarios.filter { $0.postId == publicacion_actual.id }) { comentario in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(comentario.name)
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.primary)
                                
                                Text(comentario.body)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                
                                Text("Email: \(comentario.email)")
                                    .font(.caption)
                                    .foregroundColor(.pink)
                                
                                // Divider con color azul en comentarios
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.blue.opacity(0.5)) 
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            controlador.publicacion_seleccionada(publicacion_actual.id)
            if controlador.usuarios.isEmpty {
                controlador.descargar_usuarios()
            }
        }
    }
}

// Pantalla de perfil simple del usuario
struct PantallaPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(usuario.name)
                .font(.largeTitle)
                .bold()
            
            Text("Username: \(usuario.username)")
            Text("Email: \(usuario.email)")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Perfil")
    }
}

#Preview {
    PantallaPublicacion(publicacion_actual: Publicacion(userId: 1, id: 1, title: "404", body: "No encontrado"))
        .environment(ControladorGeneral())
}
