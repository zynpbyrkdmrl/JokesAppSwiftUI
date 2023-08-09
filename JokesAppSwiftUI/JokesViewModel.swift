//
//  JokesViewModel.swift
//  JokesAppSwiftUI
//
//  Created by Zeynep Bayrak Demirel on 9.08.2023.
//

import Foundation
import Alamofire

class JokesViewModel : ObservableObject {//değişiklikler otomatik olarak viewa aktarılacak. observed object varsa tabii view tarafında.
    
    @Published var jokes = [Value]() //value olarak tutucaz. joke a ulaşmaya calışıyoruz. contentViewdan ulaşabilmek değişiklikleri gözlemleyebilmek için published.
    
    init () {
        getJokes()
    }
    
    func getJokes () {
    // şimdiye kadar isteği URLSession.shared.dataTask ile atmıştık. Şimdi endüstride sık kullanılan bir kütüphane var onu kullanıcaz. ALAMOFIRE. çok fazla istek olan yerde bunu kullanmak mantıklı.
        
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json", method: .get).responseDecodable(of: Welcome.self) { response in
            
            switch response.result {
        
            case .success(let data):
                let value = data.value
                self.jokes += value
            case .failure(let error):
                print(error)
            }
        }
        //of: nerden decode edeceğini soruyor. completionHandler: tamamlanınca bize vereceği veriyi gösteriyor.
        
        
    }
    
}
