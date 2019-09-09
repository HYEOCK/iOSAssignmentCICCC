//
//  ViewController.swift
//  Calculator
//
//  Created by doris on 21/08/2019.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 나누기
    let divide = 11
    // 곱하기
    let multiply = 12
    // 더하기
    let plus = 13
    // 빼기
    let minus = 14

  
    @IBOutlet var numberLabel: UILabel!
    
    var firstNumber : Double = 0.0
    var secondNumber : Double = 0.0
    // 피연산자
    var operand : Int = 0
    var answer : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        // display the number in the label
        numberLabel.text = numberLabel.text! + String(sender.title(for: .normal)!)
    }
    
    @IBAction func allClearTapped(_ sender: Any) {
        //if sender.self == allClearTapped(sender) {
            
    }
    
    @IBAction func calculatorTapped(_ sender: Any) {
        if operand == divide {
            answer = firstNumber / secondNumber
        }
        if operand == multiply {
            answer = firstNumber * secondNumber
        }
        
        if operand == plus {
            answer = firstNumber + secondNumber
        }
        if operand == minus {
            answer = firstNumber - secondNumber
        }
        firstNumber = 0.0
        secondNumber = 0.0
        answer = 0.0
        
    }
    
    
    
    
}

