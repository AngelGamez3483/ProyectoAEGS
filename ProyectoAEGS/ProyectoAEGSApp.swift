//
//  ProyectoAEGSApp.swift
//  ProyectoAEGS
//
//  Created by CCDM30 on 10/11/22.
//

import SwiftUI
import CoreData

@main
struct ProyectoAEGSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
