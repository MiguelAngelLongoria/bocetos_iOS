//
//  cajita_seleccion.swift
//  boceto_02
//
//  Created by Miguel Angel Longoria Granados on 24/09/25.
//

import SwiftUI
struct CajaSeleccionada: View {
    @Binding var checado: Bool
    var tamaño: CGFloat = 40
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
                .foregroundStyle(checado ? .blue: .gray)
                .onTapGesture {
                    checado.toggle()
                }
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: tamaño - (tamaño * 0.20))
                .foregroundStyle(checado ? .white: .gray)

        }
    }
}

#Preview {
    @Previewable @State var esta_checado: Bool = false
    CajaSeleccionada(checado: $esta_checado)
}
