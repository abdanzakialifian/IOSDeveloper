//
//  main.swift
//  CountingBlocks
//
//  Created by Abdan Zaki Alifian on 10/03/24.
//

import Foundation

print("Selamat Datang di Program Swift")

let width = 2.0
let height = 3.0
let length = 4.0

let volume = length * height * width
let surfaceArea = 2 * ((width * length) + (width * height) + (height * length))
let circumference = 4 * (width + length + height)

print("=================================================")

print("You have a block with : ")
print("1. The width is \(width) cm.")
print("2. The height is \(height) cm.")
print("3. The length is \(length) cm.")
print("4. The volume is \(volume) cm3.")
print("5. The surface area is \(surfaceArea) cm2.")
print("6. The circumference is \(circumference) m.")

print("=================================================")

print("Enter the block width : ")
let inputWidth = readLine()
print("Enter the block height : "); let inputHeight = readLine()
print("Enter the block length : ")
let inputLength = readLine()

if let readLineWidth = Double(inputWidth ?? "0"), let readLineHeight = Double(inputHeight ?? "0"), let readLineLength = Double(inputLength ?? "0") {
    let volumeResult = readLineLength * readLineHeight * readLineWidth
    let surfaceAreaResult = 2 * ((readLineWidth * readLineLength) + (readLineWidth * readLineHeight) + (readLineHeight * readLineLength))
    let circumferenceResult = 4 * (readLineWidth + readLineLength + readLineHeight)
    print("=================================================")
    print("You have a block with : ")
    print("1. The width is \(readLineWidth) cm.")
    print("2. The height is \(readLineHeight) cm.")
    print("3. The length is \(readLineLength) cm.")
    print("4. The volume is \(volumeResult) cm3.")
    print("5. The surface area is \(surfaceAreaResult) cm2.")
    print("6. The circumference is \(circumferenceResult) m.")
    print("=================================================")
} else {
    print("=================================================")
    print("Input not valid!")
    print("=================================================")
}

