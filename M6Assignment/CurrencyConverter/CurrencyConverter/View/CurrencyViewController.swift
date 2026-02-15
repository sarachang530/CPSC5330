//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Sara Chang on 2026-02-13.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var eurRow: UIStackView!
    @IBOutlet weak var krwRow: UIStackView!
    @IBOutlet weak var jpyRow: UIStackView!
    @IBOutlet weak var cadRow: UIStackView!
    
    @IBOutlet weak var eurValLabel: UILabel!
    @IBOutlet weak var krwValLabel: UILabel!
    @IBOutlet weak var jpyValLabel: UILabel!
    @IBOutlet weak var cadValLabel: UILabel!
    
    var usdAmount: Int = 0
    var currencyResults: [String: Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usdLabel.text = "Amount in USD: \(usdAmount)"
        
        updateUI()
    }
    
    func format(_ value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    func updateUI() {
        if let eur = currencyResults["EUR"] {
            eurRow.isHidden = false
            eurValLabel.text = format(eur)
        } else {
            eurRow.isHidden = true
        }
        
        if let krw = currencyResults["KRW"] {
            krwRow.isHidden = false
            krwValLabel.text = format(krw)
        } else {
            krwRow.isHidden = true
        }
        
        if let jpy = currencyResults["JPY"] {
            jpyRow.isHidden = false
            jpyValLabel.text = format(jpy)
        } else {
            jpyRow.isHidden = true
        }
        
        if let cad = currencyResults["CAD"] {
            cadRow.isHidden = false
            cadValLabel.text = format(cad)
        } else {
            cadRow.isHidden = true
        }
    }
        
    func convert(rate: Double) -> String {
        let convertedAmount: Double = Double(usdAmount) * rate
        return String(format: "%.2f", convertedAmount)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
