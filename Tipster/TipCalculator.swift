//
//  TipCalculator.swift
//  Tipster
//
//  Created by Maric Sobreo on 1/11/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit

class TipCalculator {
    var decimal: Bool
    var decimalPoints: Int
    var tipPercent: Int
    var groupSize: Int
    init () {
        decimal = false
        decimalPoints = 1
        tipPercent = 10
        groupSize = 1
    }
    
    func addNumber(sender: UIButton, label: UILabel) {
        if (decimal) {
            if (decimalPoints <= 2) {
                label.text = label.text! + String(sender.tag)
            }
            ++decimalPoints
        } else {
            if (label.text == "0") {
                label.text = String(sender.tag)
            } else {
                label.text = label.text! + String(sender.tag)
            }
        }
    }
    
    func addDecimal(sender: UIButton, label: UILabel) {
        if(!decimal) {
            decimal = true
            label.text = label.text! + "."
        }
    }
    
    func clear(sender: UIButton, label: UILabel) {
        label.text = "0"
        decimal = false
        decimalPoints = 1
    }
    
    func updateTipPercent(sender: UISlider) {
        tipPercent = Int(round(sender.value))
    }
    
    func updateGroupSize(sender: UISlider) {
        groupSize = Int(sender.value)
    }
    
    func calculate(billLabel: UILabel, percentLabel: UILabel, tipLabel: UILabel, totalBillLabel: UILabel, groupSizeLabel: UILabel, offset: Int) {
        let bill = Double(billLabel.text!)
        let percent = tipPercent + offset
        let truePercent = Double(percent)/100
        let tip = round2((bill! * truePercent) / Double(groupSize))
        let totalBill = round2((bill! + tip) / Double(groupSize))
        
        percentLabel.text = "\(percent)%"
        tipLabel.text = "\(tip)"
        totalBillLabel.text = "\(totalBill)"
        groupSizeLabel.text = "Group Size: \(groupSize)"
        
    }
    
    func round2(number: Double) -> Double {
        return round(number * 100) / 100
    }
}
