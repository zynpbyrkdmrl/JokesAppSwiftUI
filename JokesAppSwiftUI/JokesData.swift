//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by Zeynep Bayrak Demirel on 9.08.2023.
//

import Foundation

// listelerde bu verileri gösterebilmek için identifiable.
struct Welcome: Identifiable, Codable { // gelen veri
    let id = UUID() // bunu biz ekledik identifiable yapabilmek için.
    let type: String
    let value: [Value]
}

struct Value: Identifiable,Codable { // şaka özeli
    let id: Int
    let joke: String
    let categories: [String]
}
