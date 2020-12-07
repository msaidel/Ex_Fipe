//
//  MarcaViewModel.swift
//  Fipe
//
//  Created by Marcela Saidel on 30/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MarcaViewModel {
    
    var listaMarcas: [Marca] = []
    
    let api = APIManager()
    
    func retornaNumeroMarcas() -> Int {
            return listaMarcas.count
        }
        
    func getTitle() -> String {
        return "Fipe"
    }
    
    func getMarcas(completionHandler: @escaping(_ result: Bool, _ error: Bool) -> Void) {
        
        self.listaMarcas.removeAll()
        APIManager.request(url: "https://parallelum.com.br/fipe/api/v1/carros/marcas") { (response, error) in

            if error {
                completionHandler(false, true)
            } else {

                for item in response {
                    let marca = Marca(json: JSON(item))
                    self.listaMarcas.append(marca)

                }

                completionHandler(true, false)
            }

        }
    }
        
}
    

