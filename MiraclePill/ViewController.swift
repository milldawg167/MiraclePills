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
    @IBOutlet weak var countryTitle: UILabel!
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var postcodeTitle: UILabel!
    @IBOutlet weak var postcodeText: UITextField!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var streetAddressText: UITextField!
    @IBOutlet weak var fullNameText: UITextField!
    
    let counties = ["Bedfordshire","Berkshire","Buckinghamshire","Cambridgeshire","Cheshire","Cornwall","Cumberland","Derbyshire","Devon","Dorset","Durham","Essex","Gloucestershire","Hampshire","Herefordshire","Hertfordshire","Huntingdonshire","Kent","Lancashire","Leicestershire","Lincolnshire","Middlesex","Norfolk","Northamptonshire","Northumberland","Nottinghamshire","Oxfordshire","Rutland","Shropshire","Somerset","Staffordshire","Suffolk","Surrey","Sussex","Warwickshire","Westmorland","Wiltshire","Worcestershire","Yorkshire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buyNowBtn.isEnabled = false
        countyPicker.dataSource = self
        countyPicker.delegate = self
        fullNameText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        streetAddressText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        cityText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        countryText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        postcodeText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func countyBtnPressed(_ sender: Any) {
        countyPicker.isHidden = false
        countryText.isHidden = true
        countryTitle.isHidden = true
        postcodeText.isHidden = true
        postcodeTitle.isHidden = true
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
        countryText.isHidden = false
        countryTitle.isHidden = false
        postcodeText.isHidden = false
        postcodeTitle.isHidden = false
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let fullName = fullNameText.text, !fullName.isEmpty,
            let streetAddress = streetAddressText.text, !streetAddress.isEmpty,
            let city = cityText.text, !city.isEmpty,
            let country = countryText.text, !country.isEmpty,
            let postcode = postcodeText.text, !postcode.isEmpty
            else {
                buyNowBtn.isEnabled = false
                return
        }
        buyNowBtn.isEnabled = true
    }
    
}

