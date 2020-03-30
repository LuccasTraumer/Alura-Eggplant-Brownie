//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/13.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import UIKit

protocol AdcionaRefeicaoDelegate {
    func add( _ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {

    
    // MARK: - Atributes
    
    var delegate: AdcionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        itens = ItemDao().recuperar()
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item  = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            let item = itens[linhaDaTabela]
            itensSelecionados.append(item)
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionar(_ sender: Any) {

        if let ref = recuperarRefeicaoDoForm() {
            delegate?.add(ref)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulario")
        }
        
    }
    
    func recuperarRefeicaoDoForm() -> Refeicao? {
        guard let nome = nomeTextField?.text else { return nil }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else { return nil }
        
        let ref = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados)
        
        return ref
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Nao foi possivel atualizar a pagina")
        }

        ItemDao().save(itens)
        
    }
    
    
}

