//
//  CarroDetalheViewController.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.


import UIKit

class CarroDetalheViewController: UIViewController {
    
    @IBOutlet weak var valorLabel: UILabel!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoModeloLabel: UILabel!
    @IBOutlet weak var combustivelLabel: UILabel!
    @IBOutlet weak var mesReferenciaLabel: UILabel!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    
    var viewModel: CarroDetalheViewModel?
    var id: String?
    var codigoModelo: String?
    var modeloAno: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        viewModel = CarroDetalheViewModel()
        title = viewModel!.getTitle()
        loadData()
    }
    
    func loadData() {
       
        
        activeIndicator.startAnimating()
        viewModel?.getModelos(id: id!, codigoModelo: codigoModelo!, modeloAno: modeloAno!, completionHandler: { (success, _ ) in
            if success {
                DispatchQueue.main.async {
                   self.activeIndicator.stopAnimating()
                   updateScreen()
                }
            } else {
                self.activeIndicator.stopAnimating()
            }
        })
        
        func updateScreen() {
            
            if let carro = viewModel?.getDados() {
                valorLabel.text = carro.valor
                marcaLabel.text = carro.marca
                modeloLabel.text = carro.modelo
                anoModeloLabel.text = String(carro.anoModelo)
                combustivelLabel.text = carro.combustivel
                mesReferenciaLabel.text = carro.mesReferencia
            }
            
        }
    }

  
}
