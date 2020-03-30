//
//  Item.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/14.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    //    MARK: - Atributes
    var nome: String
    var calorias: Double
    
    //    MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
    
    //    MARK: - Constructor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}
