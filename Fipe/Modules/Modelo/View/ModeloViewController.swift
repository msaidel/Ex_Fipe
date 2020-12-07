//
//  ModeloViewController.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class ModeloViewController: UIViewController {

    @IBOutlet var modeloTableView: UITableView!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    
    var viewModel: ModeloViewModel?
    var idMarca: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewModel = ModeloViewModel()
            title = viewModel!.getTitle()
            
            
            modeloTableView.delegate = self
            modeloTableView.dataSource = self
            
           
            modeloTableView.register(UINib(nibName: "FipeTableViewCell", bundle: nil), forCellReuseIdentifier: "FipeTableViewCell")
            
            loadData()
            
        }

        func loadData() {
            
            activeIndicator.startAnimating()
            viewModel?.getModelos(id: idMarca!, completionHandler: { (success, _ ) in
                if success {
                    //debugPrint(self.controller?.listaModelo)
                    DispatchQueue.main.async {
                        self.modeloTableView.reloadData()
                    }
                    
                }
                
                self.activeIndicator.stopAnimating()
            })
        }

    }


    extension ModeloViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let ano = UIStoryboard(name: "Ano", bundle: nil).instantiateInitialViewController() as? AnoViewController {
                ano.idMarca = self.idMarca
                ano.codigoModelo = viewModel!.listaModelo[indexPath.row].codigo
                navigationController?.pushViewController(ano, animated: true)
            }
        }
    }

    extension ModeloViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel?.retornaNumeroModelos() ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FipeTableViewCell", for: indexPath) as! FipeTableViewCell
            cell.setup(titulo: viewModel!.listaModelo[indexPath.row].nome)
            return cell
        }
        
        
    }

