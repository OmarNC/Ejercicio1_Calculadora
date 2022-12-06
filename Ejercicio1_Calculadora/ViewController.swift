//
//  ViewController.swift
//  Ejercicio1_Calculadora
//
//  Created by Omar Nieto on 04/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    //Outles
    @IBOutlet weak var pantallaLabel: UILabel!
    //propiedades
    let objCalculadora : Calculadora = Calculadora()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pantallaLabel.text = "0"
    }

    @IBAction func tapNumberButton(_ boton: UIButton) {
        objCalculadora.agregarDigito(strDigito: (boton.titleLabel?.text)!)
        pantallaLabel.text = objCalculadora.getStrInput()
    }
     
    
    @IBAction func tapOperationButton(_ boton: UIButton) {
        objCalculadora.apretarOperador(strOperador:  (boton.titleLabel?.text)!)
        let strCero = objCalculadora.getStrInput()
    
        pantallaLabel.text = strCero.isEmpty ? "0" : strCero
    }
    
}

