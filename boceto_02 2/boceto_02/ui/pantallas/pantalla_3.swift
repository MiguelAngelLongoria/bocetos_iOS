//
//  pantalla_3.swift
//  boceto_2
//
//  Created by Jadzia Gallegos on 22/09/25.
//

import SwiftUI

enum SaboresPalomitas: String, CaseIterable, Identifiable{
    case Mantequilla
    case Natural
    case QuesoChedar
    case Doritos
    case Proteina
    
    var id: Self { self }
}

enum TiposSoda: String, CaseIterable, Identifiable {
    case CocaCola
    case Sprite
    case Fanta
    case Agua
    
    var id: Self { self }
}

enum TiposDulces: String, CaseIterable, Identifiable {
    case Chocolate
    case Gomitas
    case Paleta
    case Nachos
    
    var id: Self { self }
}

enum TiposAsiento: String, CaseIterable, Identifiable {
    case Normal
    case Recliner
    case VIP
    
    var id: Self { self }
}

struct PantallaOpciones: View {
    // Palomitas
    @State var quiere_palomitas: Bool = false
    @State var sabor_de_palomitas: SaboresPalomitas = .Mantequilla
    @State var cantidad_palomitas: Double = 1
    
    // Soda
    @State var quiere_soda: Bool = false
    @State var tipo_soda: TiposSoda = .CocaCola
    
    // Dulces
    @State var quiere_dulces: Bool = false
    @State var tipo_dulces: TiposDulces = .Chocolate
    
    // Asiento
    @State var quiere_asientoVIP: Bool = false
    @State var tipo_asiento: TiposAsiento = .Normal
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Formulario para calcular tu combo en el cine")
                    .font(.headline)
                
                // Palomitas
                HStack{
                    Spacer()
                    Text("¿Quieres palomitas?")
                    Spacer()
                    CajaSeleccionada(checado: $quiere_palomitas, tamaño: 25)
                    Spacer()
                }
                if quiere_palomitas{
                    VStack {
                        HStack{
                            Text("¿Cuál sabor?")
                            Picker(selection: $sabor_de_palomitas, label: Text("Sabor de palomitas")) {
                                ForEach(SaboresPalomitas.allCases) { sabor in
                                    Text(sabor.rawValue).tag(sabor)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        // silder para la CANTIDAD
                        VStack {
                            Text("Cantidad: \(Int(cantidad_palomitas))")
                            Slider(value: $cantidad_palomitas, in: 1...5, step: 1)
                        }
                        .padding(.top, 5)
                    }
                }
                
                // Soda
                HStack{
                    Spacer()
                    Text("¿Quieres soda?")
                    Spacer()
                    CajaSeleccionada(checado: $quiere_soda, tamaño: 25)
                    Spacer()
                }
                if quiere_soda {
                    HStack{
                        Text("¿Qué tipo?")
                        Picker(selection: $tipo_soda, label: Text("Sabor de soda")) {
                            ForEach(TiposSoda.allCases) { soda in
                                Text(soda.rawValue).tag(soda)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                
                // Dulces
                HStack{
                    Spacer()
                    Text("¿Quieres dulces?")
                    Spacer()
                    CajaSeleccionada(checado: $quiere_dulces, tamaño: 25)
                    Spacer()
                }
                if quiere_dulces {
                    HStack{
                        Text("¿Cuál prefieres?")
                        Picker(selection: $tipo_dulces, label: Text("Dulces")) {
                            ForEach(TiposDulces.allCases) { dulce in
                                Text(dulce.rawValue).tag(dulce)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                
                // Asiento
                HStack{
                    Spacer()
                    Text("¿Quieres asiento especial?")
                    Spacer()
                    CajaSeleccionada(checado: $quiere_asientoVIP, tamaño: 25)
                    Spacer()
                }
                if quiere_asientoVIP {
                    HStack{
                        Text("¿Qué tipo de asiento?")
                        Picker(selection: $tipo_asiento, label: Text("Asiento")) {
                            ForEach(TiposAsiento.allCases) { asiento in
                                Text(asiento.rawValue).tag(asiento)
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
        .environment(ControladorBasico())
}
