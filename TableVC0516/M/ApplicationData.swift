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

var AppData = ApplicationData()
