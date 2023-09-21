//
//  ViewController.swift
//  Calculator
//
//  Created by Nikolay Melzack on 29.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var finalLabel: UILabel!
    
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        result = 0
    }
    
    @IBAction func sumButton(_ sender: Any ) {
        
        if let firstNumber1 = Int(firstNumber.text!) {
            if let secondNumber1 = Int(secondNumber.text!) {
                result = firstNumber1 + secondNumber1
                finalLabel.text = String(result)
            }
        }
        
        
        
    }
    
    @IBAction func deductionButton(_ sender: Any) {
        if let firstNumber1 = Int(firstNumber.text!) {
            if let secondNumber1 = Int(secondNumber.text!) {
                result = firstNumber1 - secondNumber1
                finalLabel.text = String(result)
            }
        }
    }
    
    @IBAction func divideButton(_ sender: Any) {
        
        if let firstNumber1 = Int(firstNumber.text!) {
            if let secondNumber1 = Int(secondNumber.text!) {
                result = firstNumber1 / secondNumber1
                finalLabel.text = String(result)
            }
        }
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        if let firstNumber1 = Int(firstNumber.text!) {
            if let secondNumber1 = Int(secondNumber.text!) {
                result = firstNumber1 * secondNumber1
                finalLabel.text = String(result)
            }
        }
    }
}

