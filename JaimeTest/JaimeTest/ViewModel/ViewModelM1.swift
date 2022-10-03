//
//  ViewModelM1.swift
//  JaimeTest
//
//  Created by AltoMobile on 02/10/22.
//

import Foundation

class ViewModelM1 : ObservableObject {
    
    @Published var ModelData : [Model1] = []
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([Model1].self, from: data)
                DispatchQueue.main.async {
                    self.ModelData = json
                }
            }catch let error as NSError{
                print("Error in JSon", error.localizedDescription)
            }
            
        }.resume()
    }
}
