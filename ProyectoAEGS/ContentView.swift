//
//  ContentView.swift
//  ProyectoAEGS
//
//  Created by CCDM30 on 10/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let coreDM: CoreDataManager
    @State private var idempleado = ""
    @State private var nombreempleado = ""
    @State private var apepatempleado = ""
    @State private var apematempleado = ""
    @State private var telefonoempleado = ""
    @State var list = [Empleado]()
    @State var opc = [
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
                            emp in
                            HStack{
                                Image(systemName: "person")
                                Text(emp.nombreEmpleado ?? "")
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
                    
                    TextField("Id", text: $idempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                        
                    TextField("Nombre(s)", text: $nombreempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                    
                    TextField("Apellido paterno", text: $apepatempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                    
                    TextField("Apellido materno", text: $apematempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                    
                    TextField("Telefono", text: $telefonoempleado)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.telephoneNumber)
                    
                     Button("Guardar"){
                         coreDM.guardarEmpleado(id: idempleado, Nombre: nombreempleado, ApePat: apepatempleado, ApeMat: apematempleado, Telefono: telefonoempleado)
                         ObtenerTodosLosEmpleados()
                         idempleado = ""
                         nombreempleado = ""
                         apematempleado = ""
                         apepatempleado = ""
                         telefonoempleado = ""
                     }
                }
                
                .tabItem{
                    Image(systemName: "cross")
                    Text("Agregar")
                }
            }
        }.onAppear(perform: {
            ObtenerTodosLosEmpleados()
        })
    }
    func ObtenerTodosLosEmpleados(){
        list = coreDM.ObtenerTodosLosEmpleados()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
