//
//  CarroDetalheViewModel.swift
//  Fipe
//
//  Created by Marcela Saidel on 30/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarroDetalheViewModel {
    var carroDetalhe: Carro?
    
    func getModelos(id: String, codigoModelo: String, modeloAno: String, completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos/\(codigoModelo)/anos/\(modeloAno)").responseJSON { response in
            print(response.value)
            
            if let dictionary = response.value as? [String: Any]{
    
                self.carroDetalhe = Carro(json: JSON(dictionary))
                completionHandler(true, nil)
            } else {
                completionHandler(false, response.error)
            }
        }
    
    }
    
    func getTitle() -> String {
        return "Detalhes"
    }
    
    func getDados() -> Carro? {
        if let carro = carroDetalhe {
            return carro
        }
        return nil
    }
}
