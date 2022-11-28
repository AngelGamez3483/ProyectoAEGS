//
//  CoreDataManager.swift
//  ProyectoAEGS
//
//  Created by CCDM26 on 22/11/22.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "Empleado")
        persistentContainer.loadPersistentStores(completionHandler: {
            (description, error) in
            if let error = error {
                fatalError("Error al iniciar el coredata \(error.localizedDescription)")
            }
        })
    }
    func guardarEmpleado(id:String, Nombre:String, ApePat:String, ApeMat:String, Telefono:String){
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
    func ActualizarEmpleado(empleado: Empleado){
        let fetchRequest : NSFetchRequest<Empleado> = Empleado.fetchRequest()
        let predicate = NSPredicate(format: "idEmpleado = %@", empleado.idEmpleado ?? "")
        fetchRequest.predicate = predicate
        
        do{
            let datos  = try persistentContainer.viewContext.fetch(fetchRequest)
            let p = datos.first
            p?.nombreEmpleado = empleado.nombreEmpleado
            p?.apePaterno = empleado.apePaterno
            p?.apeMaterno = empleado.apeMaterno
            p?.telefono = empleado.telefono
            try persistentContainer.viewContext.save()
            print("producto guardado")
        }catch{
            print("Error en \(error)")
        }
    }
}
