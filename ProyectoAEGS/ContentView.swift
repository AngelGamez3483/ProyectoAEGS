//
//  ContentView.swift
//  ProyectoAEGS
//
//  Created by CCDM30 on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State private var idempleado = ""
    @State private var nombreempleado = ""
    @State private var apepatempleado = ""
    @State private var apematempleado = ""
    @State private var telefonoempleado = ""
    let list = [Empleado]()
    /*[
        "Elemento 1",
        "Elemento 2",
        "Elemento 3",
        "Elemento 4",
        "Elemento 5"
    ]*/
    var body: some View {
        VStack{
            TabView{
                NavigationView{
                    List{
                        ForEach(list, id: \.self){
                            idempleado in
                            HStack{
                                Image(systemName: "person")
                                Text(nombreempleado)
                            }
                            .swipeActions{
                                Button(action: {
                                    print("Eliminar")
                                }){
                                    Image(systemName: "")
                                }.tint(.red)
                                Button(action: {
                                    print("Editar")
                                }){
                                    Image(systemName: "pencil")
                                }.tint(.cyan)
                                Button(action: {
                                    print("Consultar")
                                }){
                                    Image(systemName: "eye")
                                }.tint(.green)
                                
                            }
                        }
                    }
                }
                .tabItem{
                    Image(systemName: "note")
                    Text("Datos")
                }
                VStack{
                    Text("Id de empleado")
                    TextField("Id", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                        
                    Text("Nombre(s) de empleado")
                    TextField("Nombre(s)", text: $nombreempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Apellido paterno de empleado")
                    TextField("Apellido paterno", text: $apepatempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Apellido materno de empleado")
                    TextField("Apellido materno", text: $apematempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Telefono de empleado")
                    TextField("Telefono", text: $telefonoempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    
                    /*Button("Guardar"){
                        coreDM.guardarEmpleado(id: 1, Nombre: nombreempleado, ApePat: apepatempleado, ApeMat: apematempleado, Telefono: 1234567890)
                        ObtenerTodosLosEmpleados()
                        idempleado = ""
                        nombreempleado = ""
                        apematempleado = ""
                        apepatempleado = ""
                        telefonoempleado = ""
                    }*/
                }
                Button("Guardar"){
                    coreDM.guardarEmpleado(id: 1, Nombre: nombreempleado, ApePat: apepatempleado, ApeMat: apematempleado, Telefono: 1234567890)
                    //ObtenerTodosLosEmpleados()
                    idempleado = ""
                    nombreempleado = ""
                    apematempleado = ""
                    apepatempleado = ""
                    telefonoempleado = ""
                }
                .tabItem{
                    Image(systemName: "cross")
                    Text("Agregar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
