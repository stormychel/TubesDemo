//
//  TubesDemoApp.swift
//  TubesDemo
//
//  Created by Michel Storms on 03/10/2021.
//

import SwiftUI

@main
struct TubesDemoApp: App {
    var initialBardcodeArray: [Int] = []
    
    init() {
        for _ in (1...96) {
            let number = Int.random(in: 0...9999999999999)
            initialBardcodeArray.append(number)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(barcodeArray: initialBardcodeArray)
        }
    }
}
