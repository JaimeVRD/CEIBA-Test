//
//  PostViewModel.swift
//  JaimeTest
//
//  Created by AltoMobile on 03/10/22.
//

import Foundation

class PostViewModel : ObservableObject {

    @Published var title = ""
    @Published var body = ""
    
    func fetch(userId: Int){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)") else { return }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode(Model2.self, from: data)
                DispatchQueue.main.async {
                    self.title = json.title
                    self.body = json.body
                }
            }catch let error as NSError{
                print("Error in JSon", error.localizedDescription)
            }
            
        }.resume()
    }
}
