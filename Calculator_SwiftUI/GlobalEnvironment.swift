//
//  EnvironmentTest.swift
//  Calculator_SwiftUI
//
//  Created by Athlosn90 on 21/04/2021.
//  Copyright © 2021 AndreaSanna. All rights reserved.
//


import SwiftUI


class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    @Published var displayArray = [String]()
    
    @Published var addNumbers = Int()
    
    @Published var operators = [Int]()
    
    func receiveInput(calculatorButton: CalculatorButton) {
        self.display = calculatorButton.title
        
        self.addNumbers = Int(calculatorButton.title) ?? 0
        
        operators.append(addNumbers)
        
        displayArray.append(display)
        print(operators.count)

        if operators.count > 2 {
            if self.displayArray.contains("+") {
            
                let sum = operators[0] + operators[2]
                self.display = String(describing: sum)

            }
            if self.displayArray.contains("-") {

                let sum = operators[0] - operators[2]
                self.display = String(describing: sum)
                
            }
            
            if self.displayArray.contains("X") {
                       
               let sum = operators[0] * operators[2]
                self.display = String(describing: sum)
                
            }
            
            if self.displayArray.contains("/") {
                             
                 let sum = operators[0] / operators[2]
                self.display = String(describing: sum)
                      
            }
            if self.displayArray.contains("AC") {
                                        
                operators.removeAll()
                displayArray.removeAll()
                
                                 
            }
            
            operators.removeAll()
            displayArray.removeAll()
            operators.append(Int(display)!)
        }
        
        //print(displayArray)
    }
}
