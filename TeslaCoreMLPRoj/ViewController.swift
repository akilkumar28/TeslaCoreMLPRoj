//
//  ViewController.swift
//  TeslaCoreMLPRoj
//
//  Created by AKIL KUMAR THOTA on 12/16/17.
//  Copyright © 2017 AKIL KUMAR THOTA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // IBOutlets
    @IBOutlet weak var modelSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var premiumSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var mileageLbl: UILabel!
    @IBOutlet weak var mileageSlider: UISlider!
    
    @IBOutlet weak var conditionSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var valuationLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mileageLbl.text = "MILEAGE - \(Int(mileageSlider.value)) miles"
    }
    
    //IBAction
    
    @IBAction func calculateValye(sender:Any) {
        
        if sender is UISlider {
            mileageLbl.text = "MILEAGE - \(Int(mileageSlider.value)) miles"
        }
    }


}

