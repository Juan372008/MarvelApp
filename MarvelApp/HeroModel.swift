//
//  HeroModel.swift
//  MarvelApp
//
//  Created by Juan Gallo on 24/11/2020.
//

import Foundation


protocol HeroModelProtocol {
    
    func heroesRetrieved(_ heroes:Data)
    
}

class HeroModel {
    
    var delegateHero:HeroModelProtocol?
    
    func getHeroes() {
        
//        Create a string URL
        let stringUrl = "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=f05112e6e4f5c9f98efdf65ae7a5887b&hash=a9a9e754cf12041c0639e3826cb52461"
        
//        Create a URL object
        let url = URL(string: stringUrl)
        
        
//        Check that it isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
//        Get the URL Session
        let session = URLSession.shared
//        Create the DataTask object
        let dataTask = session.dataTask(with: url!) { (datos, response, error) in
            
//            Check if there's no error and there is data
            if error == nil && datos != nil {
                let decoder = JSONDecoder()
                do {
                    let ultimoPaso = try decoder.decode(Data.self, from: datos!)
//                    let penultimoPaso = try decoder.decode(Object.self, from: datos!)
                    
                 
                    let heroes = ultimoPaso
                
                    
                    DispatchQueue.main.async {
                        self.delegateHero?.heroesRetrieved(heroes )
                    }
                    
                    
                }
                catch {
                    
                    print("Error in JSON parsing")
                }
                
            }
        }
        
//        Resume the task to fire off the request to the api
        dataTask.resume()
    
    }
    
}
