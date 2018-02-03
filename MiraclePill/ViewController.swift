//
//  ViewController.swift
//  MiraclePill
//
//  Created by Andrew Miller on 02/02/2018.
//  Copyright © 2018 Andrew Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var countyPicker: UIPickerView!
    @IBOutlet weak var countyPickerBtn: UIButton!
    
    let counties = ["Bedfordshire","Berkshire","Buckinghamshire","Cambridgeshire","Cheshire","Cornwall","Cumberland","Derbyshire","Devon","Dorset","Durham","Essex","Gloucestershire","Hampshire","Herefordshire","Hertfordshire","Huntingdonshire","Kent","Lancashire","Leicestershire","Lincolnshire","Middlesex","Norfolk","Northamptonshire","Northumberland","Nottinghamshire","Oxfordshire","Rutland","Shropshire","Somerset","Staffordshire","Suffolk","Surrey","Sussex","Warwickshire","Westmorland","Wiltshire","Worcestershire","Yorkshire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countyPicker.dataSource = self
        countyPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func countyBtnPressed(_ sender: Any) {
        countyPicker.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return counties.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return counties[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countyPickerBtn.setTitle(counties[row], for: UIControlState.normal)
        countyPicker.isHidden = true
    }
    
}

