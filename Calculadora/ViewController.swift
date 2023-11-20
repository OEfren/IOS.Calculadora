//
//  ViewController.swift
//  Calculadora
//
//  Created by Efren Ordaz on 13/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var lblOperador: UILabel!
    
    var numero: Double = 0.0
    var operador = ""
    var borrar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnClick(_ sender: Any) {
        let button = sender as! UIButton
        let text:String = button.titleLabel?.text ?? ""
        changeValue(number: text);
    }
    
    @IBAction func btnOperador(_ sender: Any) {
        let button = sender as! UIButton
        operador = button.titleLabel?.text ?? ""
        lblOperador.text = operador;
    }
    
    @IBAction func btnLimpiar(_ sender: Any) {
        lblOperador.text = ""
        txtNumero.text = ""
        numero = 0
    }
    
    @IBAction func btnIgual(_ sender: Any) {
        let operadorTexT: String = lblOperador.text ?? ""
        if (operadorTexT != "") {
            lblOperador.text = ""
            borrar = true;
            let numeroDos: Double =  Double(txtNumero.text ?? "0") ?? 0.0
            switch (operadorTexT) {
            case "+":
                changeValue(number: String(numero + numeroDos))
                break
            case "-":
                changeValue(number: String(numero - numeroDos))
                break
            case "*":
                changeValue(number: String(numero * numeroDos))
                break
            case "/":
                changeValue(number: String(numero / numeroDos))
                break
            default:
                break
            }
        }
    }
    
    func changeValue(number: String) -> Void {
        if (operador == "") {
            if (borrar) {
                borrar = false
                txtNumero.text = ""
            }
            let box: String = txtNumero.text ?? ""
            txtNumero.text = String(box + number)
        }
        else {
            operador = ""
            borrar = true;
            numero = Double(txtNumero.text ?? "0.0") ?? 0.0
            changeValue(number: number)
        }
    }
    
}

