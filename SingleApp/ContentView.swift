//
//  ContentView.swift
//  SingleApp
//
//  Created by arrow on 3/24/20.
//  Copyright © 2020 arrow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                
                Text("\(self.target)")
            }
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(
                    title: Text("Hello there!"),
                    message: Text(
                        "The slider's value is \(self.sliderValue). " +
                        "You scored \(self.pointsForCurrentRound()) points this round."
                ),dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            // Score row
            
            HStack{
                Button(action : {}) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}){
                    Text("Info")
                }
            }.padding(.bottom,20)
        
            
            
        }//vstack
        
    }
    
    func pointsForCurrentRound() -> Int {
        var difference: Int
        let roundedValue : Int = Int(self.sliderValue.rounded())
        if roundedValue > self.target {
            difference = roundedValue - self.target
        } else if self.target > roundedValue {
            difference = self.target - roundedValue
        } else {
            difference = 0
        }
        let awardedPoints : Int = 100 - difference
        return awardedPoints
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
