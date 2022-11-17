//
//  ContentView.swift
//  ProyectoAEGS
//
//  Created by CCDM30 on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var idempleado = ""
    @State private var nombreempleado = ""
    let list = [
        "Elemento 1",
        "Elemento 2",
        "Elemento 3",
        "Elemento 4",
        "Elemento 5"
    ]
    var body: some View {
        VStack{
            TabView{
                NavigationView{
                    List{
                        ForEach(list, id: \.self){
                            item in
                            HStack{
                                Image(systemName: "person")
                                Text(item)
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
                    TextField("Nombre(s)", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Apellido paterno de empleado")
                    TextField("Apellido paterno", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Apellido materno de empleado")
                    TextField("Apellido materno", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
                    
                    Text("Telefono de empleado")
                    TextField("Telefono", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        .padding()
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
        ContentView()
    }
}
