//
//  SettingsViewController.swift
//  tips
//
//  Created by Nisarga Patel on 12/29/15.
//  Copyright © 2015 Nisarga Patel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var setDefault: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        if let _ = defaults.objectForKey("defaultTip") as? Int {
            
            setDefault.selectedSegmentIndex = defaults.integerForKey("defaultTip")
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultPercentage(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(setDefault.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        let defaults = NSUserDefaults.standardUserDefaults()

        let secondVC = segue.destinationViewController as! ViewController
        
        if let _ = defaults.objectForKey("defaultTip") as? Int {
            
            secondVC.defaultTip = defaults.integerForKey("defaultTip")
            
            print(secondVC.defaultTip)

        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
