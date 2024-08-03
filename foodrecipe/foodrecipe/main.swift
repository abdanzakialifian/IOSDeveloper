//
//  main.swift
//  foodrecipe
//
//  Created by Abdan Zaki Alifian on 11/03/24.
//

import Foundation

print("Selamat Datang di Program Swift")
print("Let's make food!")

print("=================================================")

print("What do you want to make?"); let food = readLine() ?? ""
print("Enter the number of items you want to include", terminator: " : "); let newItem = readLine() ?? "0"

print("=================================================")

if let totalItems = Int(newItem) {
    var recipe = [String]()
    
    for index in 1...totalItems {
        print("Put the item in \(index)", terminator: " : "); let newItem = readLine() ?? "0"
        recipe.append(newItem)
    }
    
    print("=================================================")
    
    print("How long does the cooking process take?"); let time = readLine() ?? ""
    
    print("=================================================")
    
    recipe.sort()
    
    print("You will make \(food) for \(time) with the recipe : ")
    for (index, value) in recipe.enumerated() {
        print("\(index + 1). \(value)")
    }
} else {
    print("Input not valid!")
}

print("=================================================")


