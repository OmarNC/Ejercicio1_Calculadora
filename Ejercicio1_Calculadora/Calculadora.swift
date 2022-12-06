//
//  Calculadora.swift
//  Ejercicio1_Calculadora
//
//  Created by Omar Nieto on 05/12/22.
//

import Foundation

class Calculadora{
    
    //NOTE -Atributos
    private var num1 : Double = 0.0
    private var num2 : Double = 0.0
    private var operador : String = ""
    private var strInput : String = ""
   
    init()
    {
        self.reiniciar()
    }
    
    func agregarDigito(strDigito: String)
    {
        if isDigit(strDig: strDigito){
            strInput += strDigito
        }
        else if strDigito == "." && !strInput.contains("."){ //Si es igual a un punto, busca si la cadena ya lo tiene
            strInput += strDigito
        }
        else if strDigito == "±" {
            if strInput.contains("-") { strInput.removeFirst()}
            else{ strInput = "-" + strInput}
        }
        
        //Actualizar estado de la calculadora
        actualizarNum()
        
    }
    
    
    
    
    func apretarOperador(strOperador: String)
    {
        if isOperador(strOper: strOperador)
        {
            if  strOperador == "CE" {
                reiniciar()
            }
            else if strOperador == "⌫" {
                
                var str :String = ""
                if strInput.count >= 1 {
                    str = String(strInput.removeLast())
                }
                
                if str == "." && strInput.count >= 1 {
                    str = String(strInput.removeLast())
                }
                
                actualizarNum()
            }
            else if strOperador == "=" {
                num1 = realizarOperacion()
                num2 = 0.0
                strInput = numFormat(num: num1)
                operador = ""
            }
            else {
                if operador.isEmpty { //Si no se ha definido una operación
                    num2 = num1
                    num1 = 0.0
                    strInput = ""
                } else if strInput.count > 0 {// Si no se ha introducido el segundo operando
                    num2 = realizarOperacion()
                    num1 = 0.0
                    strInput = ""
                }
                operador = strOperador
            }
            
        }

    }
    
    
    func realizarOperacion() -> Double {
        
        var resultado : Double = 0.0
        var resultInt : Int = 0
        
        switch operador {
        case  "%":
            resultInt = Int(num2) % Int(num1)
            resultado = Double(resultInt)
        case "÷":
            resultado = num2 / num1
        case "x":
            resultado = num2 * num1
        case "-":
            resultado = num2 - num1
        case "+":
            resultado = num2 + num1
        default:
            resultado = 0.0
        }
        return resultado
    }
    
    
    func isDigit(strDig : String) -> Bool
    {
        return strDig.count == 1 && strDig >= "0" && strDig <= "9"
    }
    
    func isOperador(strOper : String) -> Bool
    {
        let strOperators = ["⌫", "%", "÷", "⌫", "x", "-", "+", "=", "CE"]
        return strOperators.contains(strOper)
    }
    
    
    private func actualizarNum()
    {
        if strInput.count > 0
        {
            num1 = Double(strInput) ?? 0.0
        }
        else {num1 = 0.0}
    }
    
    
    
    func reiniciar()
    {
        self.num1 = 0.0
        self.num2 = 0.0
        self.strInput = ""
        self.operador = ""
    }
    
    func getOperador() -> String
    {
        return operador
    }
    
    func getResult() -> Double
    {
        return num1
    }
    
    func getStrInput() -> String
    {
        if strInput.isEmpty && !operador.isEmpty {
            return numFormat(num: num2)
        }
        return strInput
    }
    
    private func numFormat(num : Double) -> String {
        if (floor(num) - num) == 0.0 {
            return String(Int(num))
        }
        return String(num)
    }
    
}
