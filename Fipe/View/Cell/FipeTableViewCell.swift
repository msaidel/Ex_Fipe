//
//  FipeTableViewCell.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class FipeTableViewCell: UITableViewCell {
    
    @IBOutlet var marcaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(titulo: String) {
        marcaLabel.text = titulo
    }
   
    
}
