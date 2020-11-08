//
//  ViewController.swift
//  tip
//
//  Created by Mingshi Wang on 11/7/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageController: UISegmentedControl!
    @IBOutlet weak var totalEach: UILabel!
    @IBOutlet weak var partySizeField: UITextField!
    @IBOutlet weak var tipPercentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tipIndex = tipPercentageController.selectedSegmentIndex
        
        var tip = 0.0
        
        var tipPercentageValue = 0.0
        
        if (tipIndex == 3) {
            tipPercentageValue = Double (tipSlider.value)
        } else {
            tipPercentageValue = tipPercentages[tipIndex]
        }
        
        tip = bill * tipPercentageValue
        
        let partySize = Double(partySizeField.text!) ?? 1

        let total = bill + tip
        let eachPersonPrice = total/partySize
        
        tipAmount.text = String(format:"$%.2f", tip)
        tipPercentage.text = String(format: "%.1f%%", tipPercentageValue*100)
        totalAmount.text = String(format: "$%.2f", total)
        totalEach.text = String(format: "$%.2f", eachPersonPrice)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

