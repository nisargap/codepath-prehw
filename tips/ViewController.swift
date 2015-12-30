//
//  ViewController.swift
//  tips
//
//  Created by Nisarga Patel on 12/29/15.
//  Copyright © 2015 Nisarga Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets which allow interfacing with view
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var defaultTip = 0
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let _ = defaults.objectForKey("defaultTip") as? Int {
            
            defaultTip = defaults.integerForKey("defaultTip")
            
        }
        
        tipControl.selectedSegmentIndex = defaultTip
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // event functions
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //print statemnets: print("user edited amount")
        
        // tip percentages, bill amount, tip, total
        var tipPercentages = [0.18, 0.2, 0.22]
        
        // grabs the currently selected index from the segment
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount + tip
        
        /****************************************
            Old code, this does not do output formatting
            tipLabel.text = "$\(tip)"
            totalLabel.text = "$\(total)"
        *****************************************/
        
        // setting the label text using string output formatting
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

