//
//  main.swift
//  Personal Data
//
//  Created by Abdan Zaki Alifian on 09/03/24.
//

import Foundation

print("Selamat Datang di Program Swift")

let firstName = "Abdan", middleName = "Zaki"
let lastName = "Alifian"
let fullName = "\(firstName) \(middleName) \(lastName)"
let address = "Banjarnegara"
let job = "iOS Developer"
let age = 24

print("=================================================")

print("Apakah kalian tahu \(fullName)?")
print("\(middleName) adalah seorang \(job)")
print("Saat ini ia berumur \(age) dan tempat tinggal di \(address)")

print("=================================================")

print("Masukkan nama depan Anda : ")
let inputFirstName = readLine()
print("Masukkan nama tengah Anda : "); let inputMiddleName = readLine()
print("Masukkan nama terakhir Anda : ")
let inputLastName = readLine()
print("Masukkan umur Anda : ")
let inputAge = readLine()
print("Masukkan alamat Anda : ")
let inputAddress = readLine()
print("Masukkan pekerjaan Anda : ")
let inputJob = readLine()

print("=================================================")

print("Apakah kalian tahu \(inputFirstName ?? "") \(inputMiddleName ?? "") \(inputLastName ?? "")?")
print("\(inputMiddleName ?? "") adalah seorang \(inputJob ?? "")")
print("Saat ini ia berumur \(inputAge ?? "") dan tempat tinggal di \(inputAddress ?? "")")

print("=================================================")
