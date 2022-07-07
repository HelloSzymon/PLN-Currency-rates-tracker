//
//  CurrencyData.swift
//  PLN Currency rates tracker
//
//  Created by Szymon Wnuk on 07/07/2022.
//

import Foundation

func fetchJson() {
    guard let url = URL(string: "https://open.er-api.com/v6/latest/pln")
    else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print(error!)
            return
        }
        
        guard let safeData = data else { return }
        do {
            let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
            var newResults = results.rates
            for (key, value) in newResults
            {
                newResults[key] = (1 / value)
            }
            
            print(newResults)
            // get value from api;
            
        } catch {
            print(error)
            
        }
    }.resume()
}


    
