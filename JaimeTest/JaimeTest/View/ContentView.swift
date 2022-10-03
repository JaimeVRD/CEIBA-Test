//
//  ContentView.swift
//  JaimeTest
//
//  Created by AltoMobile on 02/10/22.
//

import SwiftUI

struct ContentView: View {
    
   @StateObject var json = ViewModelM1()
   @State var FilterName = ""
   
    var body: some View {
       
        VStack {
            
            Text("Prueba de Ingreso")
           
            NavigationView {
                   List(json.ModelData, id:\.id){ item in
                    
                    VStack(alignment:.leading, spacing: 6){
                        Text(item.name)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("GreenTop"))
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(Color("GreenTop"))
                            Text(item.email)
                        }
                        HStack {
                            Image(systemName: "mail.fill")
                                .foregroundColor(Color("GreenTop"))
                            Text(item.phone)
                        }
                        NavigationLink(destination: PostViewTest(userId: item.id)){
                        
                            Text("VER PUBLICACION")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("GreenTop"))
                          
                        }   
                          }
                }
                .navigationTitle("Buscar Usuario")
                
            }
            .searchable(text: $FilterName)
            
            }
        
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
