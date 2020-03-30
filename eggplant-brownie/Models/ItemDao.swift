//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Takuma Shimabukuro on 2020/03/19.
//  Copyright © 2020年 Takuma Shimabukuro. All rights reserved.
//

import Foundation

class ItemDao {
    var x: Int?

    
    
    func save(_ itens: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperarCaminho() else { return }
            try dados.write(to: caminho)
        } catch {
            print (error.localizedDescription)
        }
        
        let y = x ?? 5
        y
        
    }
    
    func recuperar() -> [Item]{
        guard let caminho = recuperarCaminho() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return []}
            return itensSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperarCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
}
