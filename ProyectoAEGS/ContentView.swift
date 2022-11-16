//
//  ContentView.swift
//  ProyectoAEGS
//
//  Created by CCDM30 on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    let list = [
        "Elemento 1",
        "Elemento 2",
        "Elemento 3",
        "Elemento 4",
        "Elemento 5"
    ]
    var body: some View {
        VStack{
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
                                print("Editar")
                            }){
                                Image(systemName: "note")
                            }.tint(.cyan)
                        }
                    }
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
