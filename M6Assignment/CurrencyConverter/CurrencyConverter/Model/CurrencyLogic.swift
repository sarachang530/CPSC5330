//
//  CurrencyLogic.swift
//  CurrencyConverter
//
//  Created by Sara Chang on 2026-02-13.
//

import Foundation

// error handling
enum ValidationError: Error {
    case invalidUSD
    case noCurrencySelected
}


struct CurrencyLogic {
    
    // Conversion rates
    private let rates: [String: Double] = [
        "EUR": 0.84,
        "KRW": 1440.71,
        "JPY": 152.71,
        "CAD": 1.36
    ]
    
    // Validate USD input text
    func validUSDAmount(_ text: String) throws -> Int {
        guard let amount = Int(text) else {
            throw ValidationError.invalidUSD
        }
        
        guard amount >= 0 else {
            throw ValidationError.invalidUSD
        }
        return amount
    }
    
    // Validate currency switch (at least one switched on)
    func validateSelection(_ selected: [String]) throws {
        guard !selected.isEmpty else {
            throw ValidationError.noCurrencySelected
        }
    }
    
    // Convert USD to selected currency
    func convert(usd: Int, selected: [String]) -> [String: Double] {
        
        var results: [String: Double] = [:]
        
        for currency in selected {
            if let rate = rates[currency] {
                let convertedAmount = Double(usd) * rate
                results[currency] = convertedAmount
            }
        }
        return results
    }
}
