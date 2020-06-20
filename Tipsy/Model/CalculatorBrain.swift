//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Arnold Tjiawi on 19/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var result : Result?
    
    var percentageTip = 0.0
    var splitNumber = 2
    
    mutating func calculateBill(bill: Double, percentTip: Double, people: Int)  {
        let calculateValue = (bill*(1.0+percentTip))/Double(people)
        
        result = Result(value: calculateValue, tip: percentTip, splitNumber: people)
    }
    func getBillValue()-> Double{
        return result?.value ?? 0.0
    }
    
    func getTipPercentage()-> Int{
        let returnValue = Int((result?.tip ?? 0.0) * 100)
        return returnValue
    }
    func getSplitNumber()->Int{
        return result?.splitNumber ?? 0
    }
    
    mutating func tipSelected(sender: String)-> Int{
        
        if sender == "0%" {
            percentageTip = 0.0
            return 0
        } else if sender == "10%" {
            percentageTip = 0.1
            return 1
        } else {
            percentageTip = 0.2
            return 2
        }
    }
}
