//
//  Carro.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import SwiftyJSON

class Carro {
    var marca: String
    var modelo: String
    var anoModelo: Int
    var valor: String
    var combustivel: String
    var codigoFipe: String
    var mesReferencia: String
    var tipoVeiculo: Int
    var siglaCombustivel: String
    
    init(json: JSON) {
        self.marca = json["Marca"].stringValue
        self.modelo = json["Modelo"].stringValue
        self.anoModelo = json["AnoModelo"].intValue
        self.valor = json["Valor"].stringValue
        self.combustivel = json["Combustivel"].stringValue
        self.codigoFipe = json["CodigoFipe"].stringValue
        self.mesReferencia = json["MesReferencia"].stringValue
        self.tipoVeiculo = json["TipoVeiculo"].intValue
        self.siglaCombustivel = json["SiglaCombustivel"].stringValue
        
    }
    
}
