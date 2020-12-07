//
//  APIManager.swift
//  Fipe
//
//  Created by Marcela Saidel on 06/12/20.
//

import Foundation
import Alamofire

class APIManager {
    
    static func request(url:String, completion: @escaping (_ json: [[String: Any]], _ error: Bool) -> Void) {
        
        AF.request(url).responseJSON { (response) in
            
            if let dictionary = response.value as? [[String: Any]] {
                completion(dictionary, false)
            }
            
            completion([], true)
            
        }
        
    }
    
    
}
