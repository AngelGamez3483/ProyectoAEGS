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
    @State var editar = false
    @State var idempleado = ""
    @State var nombreempleado = ""
    @State var apepatempleado = ""
    @State var apematempleado = ""
    @State var telefonoempleado = ""
    @State var i = ""
    @State var n = ""
    @State var ap = ""
    @State var am = ""
    @State var t = ""
    @State var list = [Empleado]()
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
                                    let empleado  = emp
                                    BorrarEmpleado(empleado: empleado)
                                }){
                                    Text("Borrar")
                                }.tint(.red)
                                
                                Button(action: {
                                    i = emp.idEmpleado ?? ""
                                    n = emp.nombreEmpleado  ?? ""
                                    ap = emp.apePaterno ?? ""
                                    am = emp.apeMaterno ?? ""
                                    t = emp.telefono ?? ""
                                    editar = true
                                }){
                                    Image(systemName: "pencil")
                                }.tint(.cyan)
                                
                                /*Button(action: {
                                    print("Consultar")
                                }){
                                    Image(systemName: "eye")
                                }.tint(.green)*/
                                
                            }
                            NavigationLink(destination: ViewEditar(coreDM: coreDM, id: $i, nombre: $n, apePat: $ap, apeMat: $am, Telefono: $t), isActive: $editar){
                                Text("")
                            }.hidden()
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
    func BorrarEmpleado(empleado:Empleado){
        coreDM.BorrarEmpleado(empleado: empleado)
        ObtenerTodosLosEmpleados()
    }
    func EditarEmpleado(){
        
    }
    func CambiarPantalla(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
