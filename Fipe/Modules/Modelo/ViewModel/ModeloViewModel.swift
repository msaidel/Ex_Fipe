//
//  ModeloViewModel.swift
//  Fipe
//
//  Created by Marcela Saidel on 30/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ModeloViewModel {
    
    var listaModelo: [Modelo] = []
    
    func getModelos(id: String, completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos").responseJSON { response in
            print(response.value)
            var listModelos: [Modelo] = []
            
            if let dictionary = response.value as? [String: Any], let lista = dictionary["modelos"] as? [[String: Any]]{
                for item in lista {
                    let modelo = Modelo(json: JSON(item))
                    listModelos.append(modelo)
                }
                self.listaModelo = listModelos
                completionHandler(true, nil)
            } else {
                completionHandler(false, response.error)
            }
        }
    
    }
    
    func getTitle() -> String {
        return "Modelo"
    }
    
    func retornaNumeroModelos() -> Int {
        return listaModelo.count
    }
}
