//
//  main.swift
//  playonwords
//
//  Created by Abdan Zaki Alifian on 10/03/24.
//

import Foundation

print("Selamat Datang di Program Swift")
print("Let's play with words!")

print("=================================================")

print("Enter your first name : ")
let firstName = String(readLine() ?? "")
print("Enter your last name : ")
let lastName = String(readLine() ?? "")

print("=================================================")

print("The following are the operators used : ")

let concatenationString = firstName + " " + lastName
print("1. String Concatenation Operator : \"\(concatenationString)\"")

var mutabilityString = ""
mutabilityString += firstName
mutabilityString += " " + lastName
print("2. String Mutability Operator : \"\(mutabilityString)\"")

var comparasionString = ""
if firstName == lastName {
    comparasionString = String(true)
} else {
    comparasionString = String(false)
}
print("3. String Comparasion Operator : \"\(comparasionString)\"")

print("=================================================")

print("The following are the functions used : ")

let fullName = firstName + " " + lastName

let emptyString = firstName.isEmpty || lastName.isEmpty
print("1. Name is empty \"\(emptyString)\"")

let startIndex = fullName[fullName.startIndex]
print("2. Start Index Name : \"\(startIndex)\"")

let index = fullName[fullName.index(fullName.startIndex, offsetBy: 3)]
print("3. Index 3 of Name : \"\(index)\"")

let endIndex = fullName[fullName.index(before: fullName.endIndex)]
print("4. End Index Name : \"\(endIndex)\"")

var insert = fullName
insert.insert("!", at: insert.endIndex)
print("5. Insert Character to Name : \"\(insert)\"")

var remove = insert
remove.remove(at: remove.index(before: remove.endIndex))
print("6. Remove Character in Name : \"\(remove)\"")

var append = firstName
append.append(" ")
append.append(lastName)
print("7. Append Name : \"\(append)\"")

let count = fullName.count
print("8. Length of Name : \"\(count)\"")

print("=================================================")




