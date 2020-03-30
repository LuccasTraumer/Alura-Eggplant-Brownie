//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/14.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {

    //   MARK: - Atribute
    let nome: String
    let felicidade: Int
    var itens: [Item] = []
    
    //   MARK: - Constructor
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    //    MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! [Item]
        
    }
    
    //  MARK: - Method
    func totalCalorias() -> Double {
        var total = 0.0
        for item in self.itens {
            total += item.calorias
        }
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
    
}
