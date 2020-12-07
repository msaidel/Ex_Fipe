//
//  ViewController.swift
//  Fipe
//
//  Created by Marcela Saidel on 18/11/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var marcaTableView: UITableView!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    var viewModel: MarcaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MarcaViewModel()
        
        configNavigation()
        configTableView()
        
        loadData()
        
    }
    
    func configNavigation() {
        
        title = viewModel!.getTitle()
        navigationController?.navigationBar.makeClear()
        
    }
    
    func configTableView() {
        
        marcaTableView.delegate = self
        marcaTableView.dataSource = self
        
        marcaTableView.register(UINib(nibName: "FipeTableViewCell", bundle: nil), forCellReuseIdentifier: "FipeTableViewCell")
    }
    
    func loadData() {
        
        activeIndicator.startAnimating()
        viewModel?.getMarcas(completionHandler: { ( success , error ) in
            DispatchQueue.main.async {
                self.activeIndicator.stopAnimating()
                self.marcaTableView.reloadData()
            }
        })
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cod = viewModel!.listaMarcas[indexPath.row].codigo
        
        if !(cod.isEmpty) {
            
            if let destination = UIStoryboard(name: "Modelo", bundle: nil).instantiateInitialViewController() as? ModeloViewController {
                destination.idMarca = cod
                self.navigationController?.pushViewController(destination, animated: true)
            }
            
            
        }
        
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.retornaNumeroMarcas() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FipeTableViewCell", for: indexPath) as! FipeTableViewCell
        cell.setup(titulo: viewModel!.listaMarcas[indexPath.row].nome)
        return cell
    }
    
}
