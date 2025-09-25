import SwiftUI

enum SaboresPalomitas: String, CaseIterable, Identifiable {
    case Mantequilla
    case Natural
    case Quesochedar
    case Doritos
    case Proteina
    
    var id: Self { self }
}

struct PantallaOpciones: View {
    @State var quiere_palomitas: Bool = false
    @State var sabor_de_palomitas: SaboresPalomitas = .Mantequilla
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text("Formulario para calcular si quieres palomitas")
                    .font(.headline)
                
                HStack {
                    Spacer()
                    Text("¿Quieres palomitas?")
                    Toggle("", isOn: $quiere_palomitas)
                        .labelsHidden()
                        .frame(width: 50)
                    Spacer()
                }
                if quiere_palomitas{
                    HStack {
                        Text("¿Cuál sabor?")
                        Picker("Sabor de palomitas", selection: $sabor_de_palomitas) {
                            ForEach(SaboresPalomitas.allCases) { sabor in
                                Text(sabor.rawValue).tag(sabor)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                Spacer()
                Text("¿Quieres palomitas?")
                Toggle("", isOn: $quiere_palomitas)
                    .labelsHidden()
                    .frame(width: 50)
                Spacer()
                if quiere_palomitas{
                    HStack {
                        Text("¿Cuál sabor?")
                        Picker("Sabor de palomitas", selection: $sabor_de_palomitas) {
                            ForEach(SaboresPalomitas.allCases) { sabor in
                                Text(sabor.rawValue).tag(sabor)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PantallaOpciones()
}


//agregar un slide que cantidad de pañlomitas queire comer

