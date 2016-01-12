//
//  ViewController.swift
//  Tipster
//
//  Created by Maric Sobreo on 1/10/16.
//  Copyright © 2016 Maric Sobreo (Coding Dojo). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calculator = TipCalculator()
    
    // received bill
    @IBOutlet weak var receivedBillLabel: UILabel!
    // low end + 0
    @IBOutlet weak var tipPercent0Label: UILabel!
    @IBOutlet weak var tipAmount0Label: UILabel!
    @IBOutlet weak var totalBill0Label: UILabel!
    // middle + 5
    @IBOutlet weak var tipPercent5Label: UILabel!
    @IBOutlet weak var tipAmount5Label: UILabel!
    @IBOutlet weak var totalBill5Label: UILabel!
    // high end + 10
    @IBOutlet weak var tipPercent10Label: UILabel!
    @IBOutlet weak var tipAmount10Label: UILabel!
    @IBOutlet weak var totalBill10Label: UILabel!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    
    @IBAction func numberButtonPressed(sender: UIButton) {
        calculator.addNumber(sender, label: receivedBillLabel)
        updateValues()
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        calculator.clear(sender, label: receivedBillLabel)
        updateValues()
    }
    
    @IBAction func decimalButtonPressed(sender: UIButton) {
       calculator.addDecimal(sender, label: receivedBillLabel)
    }
    
    @IBAction func tipPercentageSlided(sender: UISlider) {
        calculator.updateTipPercent(sender)
        updateValues()
    }
    
    @IBAction func groupSizeSlided(sender: UISlider) {
        calculator.updateGroupSize(sender)
        updateValues()
    }
    
    func updateValues() {
        calculator.calculate(receivedBillLabel, percentLabel: tipPercent0Label, tipLabel: tipAmount0Label, totalBillLabel: totalBill0Label, groupSizeLabel: groupSizeLabel, offset: 0)
        calculator.calculate(receivedBillLabel, percentLabel: tipPercent5Label, tipLabel: tipAmount5Label, totalBillLabel: totalBill5Label, groupSizeLabel: groupSizeLabel, offset: 5)
        calculator.calculate(receivedBillLabel, percentLabel: tipPercent10Label, tipLabel: tipAmount10Label, totalBillLabel: totalBill10Label, groupSizeLabel: groupSizeLabel, offset: 10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

