//
//  ContentView.swift
//  TubesDemo
//
//  Created by Michel Storms on 03/10/2021.
//

import SwiftUI

var totalTubes = 96
var edgeWidth = 10
var horizontalTubes = 8
var verticalTubes = totalTubes/horizontalTubes

struct ContentView: View {
    @State var barcodeArray: [Int]

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .gesture(
                    TapGesture()
                        .onEnded({
                            print("Tapped!")
                            for index in (0...96-1) {
                                let number = Int.random(in: 0...9999999999999)
                                barcodeArray[index] = number
                            }
                        })
                )
            VStack {
                ForEach(0..<verticalTubes) { v in
                    HStack {
                        ForEach(1..<horizontalTubes+1) { h in
                            let tubeNumber = h + (v*horizontalTubes)
                            
                            Tube(barCode: barcodeArray[tubeNumber-1], tubeNumber: tubeNumber)
                        }
                    }
                }
            }
        }
        .statusBar(hidden: true)
    }
}

struct Tube: View {
    var barCode: Int
    var tubeNumber: Int
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(isEven(barcode: barCode) ? .green : .red)
                .opacity(0.25)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 5, y: 5)
            Text("\(tubeNumber)")
                .foregroundColor(.black)
                .font(.title)
        }
    }
    
    func isEven(barcode: Int) -> Bool {
        if(barcode % 2 == 0){
            return true
        }else{
            return false
        }
    }
}
