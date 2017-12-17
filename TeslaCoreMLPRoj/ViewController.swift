//
//  ViewController.swift
//  TeslaCoreMLPRoj
//
//  Created by AKIL KUMAR THOTA on 12/16/17.
//  Copyright © 2017 AKIL KUMAR THOTA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cars = Cars()
    
    
    // IBOutlets
    @IBOutlet weak var modelSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var premiumSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var mileageLbl: UILabel!
    @IBOutlet weak var mileageSlider: UISlider!
    
    @IBOutlet weak var conditionSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var valuationLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateValye(sender: self)
        mileageLbl.text = "MILEAGE - \(Int(mileageSlider.value)) miles"
    }
    
    //IBAction
    
    @IBAction func calculateValye(sender:Any) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedMileage = formatter.string(for: mileageSlider.value) ?? "0"
        mileageLbl.text = "MILEAGE - \(formattedMileage) miles"
        
        
        if let prediction = try? cars.prediction(model: Double(modelSegmentControl.selectedSegmentIndex), premium: Double(premiumSegmentControl.selectedSegmentIndex), mileage: Double(mileageSlider.value), condition: Double(conditionSegmentControl.selectedSegmentIndex)) {
            
            let clampedValuation = max(2000,prediction.price)
            formatter.numberStyle = .currency
            valuationLbl.text = formatter.string(for: clampedValuation)
            
        } else {
            valuationLbl.text = "Error"
        }
    }
}

