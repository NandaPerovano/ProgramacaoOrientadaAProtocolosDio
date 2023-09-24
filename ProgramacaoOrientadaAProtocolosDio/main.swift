//
//  main.swift
//  ProgramacaoOrientadaAProtocolosDio
//
//  Created by Fernanda Perovano on 17/09/23.
//

import Foundation

protocol Formatura {
    func registrarConselho(periodoDeFaculdade: Int, profissao: String) -> String
    func retirarDiploma(periodoDeFaculdade: Int) -> String
}

class Profissao: Formatura {

    var profissao: String
    var anoDeFormatura: Int
    var periodoDeFaculdade: Int
    
    init(profissao: String, anoDeFormatura: Int, periodoDeFaculdade: Int) {
        self.profissao = profissao
        self.anoDeFormatura =  anoDeFormatura
        self.periodoDeFaculdade = periodoDeFaculdade
    }
    
    func registrarConselho(periodoDeFaculdade: Int, profissao: String) -> String {
        let periodos = periodoDeFaculdade
        let profissao = profissao
        var status = ""
        if periodos <= 8 {
            status = "o aluno não poderá se registrar no conselho de \(profissao)"
        } else {
            status = "o aluno poderá retirar seu diploma da \(profissao)"
        }
        return status
    }
    
    func retirarDiploma(periodoDeFaculdade: Int) -> String {
        let periodos = periodoDeFaculdade
        var status = ""
        if periodos < 8 {
          status = "o aluno não formou ainda"
        } else {
           status = "o aluno já formou"
        }
        return status
    }
}

class Medicina: Profissao {
    
    override init(profissao: String, anoDeFormatura: Int, periodoDeFaculdade: Int) {
        super.init(profissao: profissao, anoDeFormatura: anoDeFormatura, periodoDeFaculdade: periodoDeFaculdade)
    }
    
    override func retirarDiploma(periodoDeFaculdade: Int) -> String {
        let periodos = periodoDeFaculdade
        var status = ""
        if periodos < 12 {
          status = "o aluno não formou ainda"
        } else {
            status = "o aluno já formou"
        }
        return status
    }

    override func registrarConselho(periodoDeFaculdade: Int, profissao: String) -> String {
        let periodos = periodoDeFaculdade
        let profissao = profissao
        var status = ""
        if periodos <= 12 {
           status = "O aluno não poderá se registrar no conselho de \(profissao)"
        } else {
           status = "O aluno poderá retirar seu diploma da \(profissao)"
        }
        return status
    }
}

class Fisioterapia: Profissao {
    
    override init(profissao: String, anoDeFormatura: Int, periodoDeFaculdade: Int) {
        super.init(profissao: profissao, anoDeFormatura: anoDeFormatura, periodoDeFaculdade: periodoDeFaculdade)
    }
    
    override func retirarDiploma(periodoDeFaculdade: Int) -> String {
        let periodos = periodoDeFaculdade
        var status = ""
        if periodos < 10 {
           status = "O aluno não formou ainda"
        } else {
            status = "O aluno já formou"
        }
        return status
    }

    override func registrarConselho(periodoDeFaculdade: Int, profissao: String) -> String {
        let periodos = periodoDeFaculdade
        let profissao = profissao
        var status = ""
        if periodos < 10 {
           status = "O aluno não poderá se registrar no conselho de \(profissao)"
        } else {
            status = "O aluno poderá retirar seu diploma da \(profissao)"
        }
        return status
    }
}

let estudante: Profissao = Profissao(profissao: "estudante", anoDeFormatura: 0, periodoDeFaculdade: 0)
let estudanteDeMedicina: Medicina = Medicina(profissao: "medicina", anoDeFormatura: 2024, periodoDeFaculdade: 12)
let estudanteDeFisioterapia: Fisioterapia = Fisioterapia(profissao: "fisioterapia", anoDeFormatura: 2023, periodoDeFaculdade: 10)
let estudanteFormado = estudante.retirarDiploma(periodoDeFaculdade: 0)


print("O \(estudante.profissao) ainda não passou no vestibular e \(estudanteFormado)")
print(estudanteDeFisioterapia.registrarConselho(periodoDeFaculdade: estudanteDeFisioterapia.periodoDeFaculdade, profissao: estudanteDeFisioterapia.profissao))
print(estudanteDeMedicina.registrarConselho(periodoDeFaculdade: estudanteDeMedicina.periodoDeFaculdade, profissao: estudanteDeMedicina.profissao))

switch estudanteDeMedicina.anoDeFormatura {
case let x where x <= 2023 :
   print("O aluno de medicina não poderá retirar o diploma nem registrar no conselho de sua profissão")
case let x where x >= 2023 :
    print("O aluno de medicina poderá retirar o diploma e se registrar no conselho de sua profissão")
default:
    print("O estudante já formou")
}

enum ProfissionalDaSaudeFormado {
    case Fisioterapia
    case Medicina
    
    func profissionalFormado() -> String {
        switch self {
        case .Fisioterapia :
           return "O profissional formado é Fisioterapeuta"
        case .Medicina :
           return "O profissional formado é Médico"
        }
    }
}

let profissional = ProfissionalDaSaudeFormado.Fisioterapia
print(profissional.profissionalFormado())

struct SegundaGraduacao {
    var profissao : [String]
}

var profissionais: SegundaGraduacao = SegundaGraduacao(profissao: [])

profissionais.profissao.append("Computacao")
profissionais.profissao.append("Arquitetura")
profissionais.profissao.append("Matemática")


let profissaoString = profissionais.profissao.joined(separator: " ")

print("O profissional de \(estudanteDeFisioterapia.profissao) também está estudando \(profissaoString.replacingOccurrences(of: " ", with: ", "))")

for elemento in profissionais.profissao {
    print("A profissão escolhida para transição de carreira foi \(elemento)")
}
    
var indice = 0

while indice < profissionais.profissao.count {
    let profissao = profissionais.profissao[indice]
    print("A profissão escolhida para transição de carreira foi \(profissao)")
    indice += 1
}
