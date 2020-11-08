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
    @IBOutlet weak var tipPercentageController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipPercentageController.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipAmount.text = String(format:"$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

