//
//  AnoViewModel.swift
//  Fipe
//
//  Created by Marcela Saidel on 30/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AnoViewModel {
    var listaAno: [AnoModelo] = []

    
    func getAnos(id: String, codigoModelo: String, completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos/\(codigoModelo)/anos").responseJSON { response in
            //print(response.value)
            
            if let listAno = response.value as? [[String: Any]] {
                for item in listAno {
                    let ano = AnoModelo(json: JSON(item))
                    self.listaAno.append(ano)
                }
                completionHandler(true, nil)
            } else {
                completionHandler(false, response.error)
            }
        }
    
    }
    
    func getTitle() -> String {
        return "Ano"
    }
    
    func retornaNumeroAnos() -> Int {
        return listaAno.count
    }
}
