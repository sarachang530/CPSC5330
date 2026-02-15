//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sara Chang on 2026-02-13.
//

import UIKit

//// error handling
//enum ValidationError: Error {
//    case invalidUSD
//    case noCurrencySelected
//}


class ViewController: UIViewController {
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var krwSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    
    var currencyLogic = CurrencyLogic()
    var usdAmountTosSend: Int = 0
    var currenciesToSend: [String: Double] = [:]
    //    let text = usdTextField.text ?? ""
    //    let usd = try CurrencyLogic.validUSDAmount(from: text)
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    
    func selectedCurrenciesArray() -> [String] {
        var selected: [String] = []
        if eurSwitch.isOn { selected.append("EUR") }
        if krwSwitch.isOn { selected.append("KRW") }
        if jpySwitch.isOn { selected.append("JPY") }
        if cadSwitch.isOn { selected.append("CAD") }
        
        return selected
    }
    
    //    func getSelectedCurrencies() -> [String] {
    //        var selected
    //    }
    
    //    // at least one currency is selected
    //    func hasSelectedCurrency() -> Bool {
    //        return eurSwitch.isOn || krwSwitch.isOn || jpySwitch.isOn || cadSwitch.isOn
    //    }
    //
    //    // validation check (Int only in text field and atleast one currency selected)
    //    func validateInput() throws -> Int {
    //        let text = usdTextField.text ?? ""
    //
    //        guard let amount = Int(text) else {
    //            throw ValidationError.invalidUSD
    //        }
    //
    //        guard amount > 0 else {
    //            throw ValidationError.invalidUSD
    //        }
    //
    //        guard hasSelectedCurrency() else {
    //            throw ValidationError.noCurrencySelected
    //        }
    //        return amount
    //    }
    //
    @IBAction func convertButton(_ sender: UIButton) {
        errorLabel.text = ""
        let text = usdTextField.text ?? ""
        
        do {
            let usd = try currencyLogic.validUSDAmount(text)
            let selected = selectedCurrenciesArray()
            try currencyLogic.validateSelection(selected)
            let results = currencyLogic.convert(usd: usd, selected: selected)
            
            usdAmountTosSend = usd
            currenciesToSend = results
            
            performSegue(withIdentifier: "toCurrency", sender: self)
            
        } catch ValidationError.invalidUSD {
            errorLabel.text = "Please enter a valid US Dollar amount."
        } catch ValidationError.noCurrencySelected {
            errorLabel.text = "Please select at least one currency."
        } catch {
            errorLabel.text = "An unexpected error occurred."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCurrency" {
            let currencyVC = segue.destination as! CurrencyViewController
            currencyVC.usdAmount = usdAmountTosSend
            currencyVC.currencyResults = currenciesToSend
            
        }
        
    }
    
}

