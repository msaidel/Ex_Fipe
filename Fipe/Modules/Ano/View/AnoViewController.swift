//
//  AnoViewController.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class AnoViewController: UIViewController {


    @IBOutlet weak var anoTableView: UITableView!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    
    var viewModel: AnoViewModel?
    var idMarca: String?
    var codigoModelo: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewModel = AnoViewModel()
            title = viewModel!.getTitle()
            
            anoTableView.delegate = self
            anoTableView.dataSource = self
            
           
            anoTableView.register(UINib(nibName: "FipeTableViewCell", bundle: nil), forCellReuseIdentifier: "FipeTableViewCell")
            
            loadData()
            
        }

        func loadData() {
            activeIndicator.startAnimating()
            viewModel?.getAnos(id: idMarca!, codigoModelo: codigoModelo!, completionHandler: { (success, _ ) in
                if success {
                    DispatchQueue.main.async {
                        self.activeIndicator.stopAnimating()
                        self.anoTableView.reloadData()
                    }

                } else {
                    self.activeIndicator.stopAnimating()
                }
                
                
            })
        }

    }


    extension AnoViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let carroDetalhe = UIStoryboard(name: "CarroDetalhe", bundle: nil).instantiateInitialViewController() as? CarroDetalheViewController {
                carroDetalhe.id = self.idMarca
                carroDetalhe.codigoModelo = self.codigoModelo
                carroDetalhe.modeloAno = String(viewModel!.listaAno[indexPath.row].codigo)
                navigationController?.pushViewController(carroDetalhe, animated: true)
            }
        }
    }

    extension AnoViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel?.retornaNumeroAnos() ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FipeTableViewCell", for: indexPath) as! FipeTableViewCell
            cell.setup(titulo: viewModel!.listaAno[indexPath.row].nome)
            return cell
        }
        
        
    }

