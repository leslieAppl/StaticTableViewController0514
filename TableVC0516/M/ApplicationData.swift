//
//  ApplicationData.swift
//  TableVC0516
//
//  Created by leslie on 5/16/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct ApplicationData {
    var items: [String]
    var fileteredItems: [String] = []
    
    init() {
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        
        filterData(search: "")
    }
    
    mutating func filterData(search: String) {
        if search == "" {
            fileteredItems = items
        } else {
            fileteredItems = items.filter({ (item) -> Bool in
                let value1 = item.lowercased()
                let value2 = search.lowercased()
                let valid = value1.hasPrefix(value2)
                return valid
            })
        }
        
        fileteredItems.sort { (value1, value2) -> Bool in
            value1 < value2
        }
    }
    
}

struct ApplicationData2 {
    var items: [String]
    var calories: [String: Int]
    var selectedButton: Int
    var fileteredItems: [String] = []
    
    init() {
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        
        calories = ["Lettuce": 15, "Tomatoes": 18, "Milk": 42, "Granola": 471, "Donuts": 452, "Cookies": 502, "Butter": 717, "Cheese": 402, "Lemonade": 40, "Yogurt": 59, "Oatmeal": 68, "Juice": 23, "Tea": 1, "Coffee": 0, "Bagels": 250, "Brownies": 466, "Potatoes": 77, "Onions": 40]
        
        selectedButton = 0

        filterData(search: "")
    }
    
    mutating func filterData(search: String) {
        if search == "" {
            fileteredItems = items
        } else {
            fileteredItems = items.filter({ (item) -> Bool in
                var valid = false
                
                if selectedButton == 0 {
                    let value1 = item.lowercased()
                    let value2 = search.lowercased()
                    valid = value1.hasPrefix(value2)
                }
                else if let maximum = Int(search) {
                    let caloriesItem = calories[item]
                    if caloriesItem! < maximum {
                        valid = true
                    }
                }
                
                return valid
            })
        }
        
        fileteredItems.sort { (value1, value2) -> Bool in
            value1 < value2
        }
    }
    
}

var AppData = ApplicationData()
var AppData2 = ApplicationData2()
