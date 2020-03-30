//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/19.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    var controller: UITableViewController
    
    init(controller: UITableViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        
        let remove = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alert.addAction(remove)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
