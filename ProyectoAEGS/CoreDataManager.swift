//
//  CoreDataManager.swift
//  ProyectoAEGS
//
//  Created by CCDM26 on 22/11/22.
//

import Foundation
import CoreData

class CoreData{
    let persistentContainer: NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "Producto")
        persistentContainer.loadPersistentStores(completionHandler: {
            (description, error) in
            if let error = error {
                fatalError("Error al iniciar el coredata \(error.localizedDescription)")
            }
        })
    }
    func guardarEmpleado(id:Int32, Nombre:String, ApePat:String, ApeMat:String, Telefono:Int16){
        let empleado = Empleado(context: persistentContainer.viewContext)
        empleado.idEmpleado = id
        empleado.nombreEmpleado = Nombre
        empleado.apePaterno = ApePat
        empleado.apeMaterno = ApeMat
        empleado.telefono = Telefono
        
        do{
            try persistentContainer.viewContext.save()
            print("Empleado guardado exitosamente")
        }catch{
            print("Error al guardar al empleado")
        }
    }
    func ObtenerTodosLosEmpleados() -> [Empleado] {
        let fetchRequest: NSFetchRequest<Empleado> = Empleado.fetchRequest()
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }
    func BorrarEmpleado(empleado:Empleado){
        persistentContainer.viewContext.delete(empleado)
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("Error al guardar \(error.localizedDescription)")
        }
    }
}