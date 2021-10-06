//
//  Model.swift
//  CalculatorAssignmentOne
//
//  Created by user202286 on 9/21/21.
//

import Foundation

class Calculator{
    var operationString = [String]()
    var lastOperator : String = " "
    var result = 0
    var currentValue = 0

    
    func push (s : String) -> [String] {
            for char in s {
                operationString.append(String(char))
            }
            return operationString
    }
    
    func validate() -> String{
        var error : String = ""
        if operationString.count > 1 {
            if Int(operationString[operationString.count - 1]) != nil &&  (Int(operationString[operationString.count - 2]) != nil){
                error = "Sorry our application only accept one digit"
            }else if Int(operationString[operationString.count - 1]) == nil &&  (Int(operationString[operationString.count - 2]) == nil){
                error = "Sorry our application only accept one operator"
            }
        }else if Int(operationString[0]) == nil{
            error = "First input has to be a number"
        }
        return error
    }
    func calc()-> Int{
        result = 0
        lastOperator = ""
        for element in operationString{
                if Int(element) != nil {
                switch lastOperator
            {
                case "+":
                    result += Int(element)!

                case "-":
                    result -= Int(element)!

                case "*":
                    result *= Int(element)!

                case "/":
                    result /= Int(element)!
                default:
                    result += Int(element)!
                }
            }else{
                lastOperator = element
            }
        }
        operationString = []
        return result
    }
    
}
