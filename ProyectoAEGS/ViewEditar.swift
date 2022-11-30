//
//  ViewEditar.swift
//  ProyectoAEGS
//
//  Created by CCDM26 on 28/11/22.
//

import SwiftUI
import CoreData

struct ViewEditar:  View{
    let coreDM: CoreDataManager
    @Binding var id: String
    @Binding var nombre: String
    @Binding var apePat: String
    @Binding var apeMat: String
    @Binding var Telefono: String
    var body: some View{
        VStack{
            TextField("Nombre(s)", text: $nombre)
                .textFieldStyle(.roundedBorder)
                .textContentType(.telephoneNumber)
            
            TextField("Apellido paterno", text: $apePat)
                .textFieldStyle(.roundedBorder)
                .textContentType(.telephoneNumber)
            
            TextField("Apellido materno", text: $apeMat)
                .textFieldStyle(.roundedBorder)
                .textContentType(.telephoneNumber)
            
            TextField("Telefono", text: $Telefono)
                .textFieldStyle(.roundedBorder)
                .textContentType(.telephoneNumber)
            
             Button("Guardar"){
                 coreDM.ActualizarEmpleado(id: id, nombre: nombre, apepat: apePat, apemat: apeMat, telefono: Telefono)
             }
        }
    }
}
