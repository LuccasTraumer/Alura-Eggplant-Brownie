import UIKit

class Refeicao {
    let nome: String
    let felicidade: Int
    var itens: [Item] = []
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func  totalCalorias() -> Double {
        var total = 0.0
        
        for item in self.itens {
            total += item.calorias
        }
        
        return total
    }
}

class Item {
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let ref = Refeicao(nome: "almoco", felicidade: 5)

let arroz = Item(nome: "arroz", calorias: 51.0)
let feijao = Item(nome: "feijao", calorias: 90.0)
let contraFile = Item(nome: "contraFile", calorias: 287.5)

ref.itens.append(arroz)
ref.itens.append(feijao)
ref.itens.append(contraFile)

print("Eu comi \(ref.nome) e fiquei com \(ref.felicidade) de felicidade que continha \(ref.totalCalorias()) kg de calorias")

