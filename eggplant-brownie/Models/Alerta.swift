//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/18.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import UIKit

class Alerta{
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Desculpe", mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
