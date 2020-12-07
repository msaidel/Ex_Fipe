//
//  Marca.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import SwiftyJSON

class Marca {
    var nome: String
    var codigo: String
    
    init(json: JSON) {
      self.nome = json["nome"].stringValue
      self.codigo = json["codigo"].stringValue
    }
    
}
