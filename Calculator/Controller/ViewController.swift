//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishingTipyngNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    //MARK: - Botoes de calculo
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        self.isFinishingTipyngNumber = true
                
        self.isFinishingTipyngNumber = true
                
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
 
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    //MARK: - Botoes de valores
    @IBAction func numButtonPressed(_ sender: UIButton) {
                
        if let numValue = sender.currentTitle {
                    
            if self.isFinishingTipyngNumber {
                displayLabel.text = numValue
                self.isFinishingTipyngNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

