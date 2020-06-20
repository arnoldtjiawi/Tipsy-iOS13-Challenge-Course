//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let tipValue = calculatorBrain.tipSelected(sender: sender.currentTitle!)
        if tipValue == 0 {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if tipValue == 1 {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = String(calculatorBrain.splitNumber)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = Double(billTextField.text ?? "0.0")
        calculatorBrain.calculateBill(bill: billValue!, percentTip: calculatorBrain.percentageTip, people: Int(calculatorBrain.splitNumber))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.calculateBill = calculatorBrain.getBillValue()
            destinationVC.splitNumber = calculatorBrain.getSplitNumber()
            destinationVC.percentTip = calculatorBrain.getTipPercentage()
            
        }
    }
    
}

