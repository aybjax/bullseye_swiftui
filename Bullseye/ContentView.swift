//
//  ContentView.swift
//  Bullseye
//
//  Created by aybjax on 5/22/21.
//

import SwiftUI

struct ContentView: View {
        
    // Properties
    // ==========
    var sliderInt: Int {
        Int(
            sliderValue.rounded()
        )
    }
    
    // User interface views
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
//    @State var target: Int = .random(in: 1...100)
    @State var target = Int.random(in: 1...100)
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .padding()
                Text("\(target)")
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
//                Slider(value: Binding.constant(100))
//                Slider(value: .constant(100))
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                print("button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(
                    title: Text("Hello there"),
                    message: Text(
                        scoringMessage()
                    ),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
            
            Spacer()
            
            // Score row
            HStack {
                Button("Start over") {}
                
                Spacer()
                
                Text("Score:")
                Text("99999")
                
                Spacer()
                
                Text("Round:")
                Text("99999")
                
                Spacer()
                
                Button(action:{}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    
    // Methods
    // =======
    
    func btnPrsd() {
        print("Button pressed!")
        self.alertIsVisible = true
    }
    
    func pointsForCurrentRound() -> Int {
        let diff: Int
        diff = sliderInt > target ?
                sliderInt - target :
                target - sliderInt
        
        return 100 - diff
    }
    
    func scoringMessage() ->String {
        "The slider value is \(sliderInt).\n" +
        "The target value is \(target).\n" +
        "You scored \(pointsForCurrentRound()) points this round."
    }
}

// Preview
// =======

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
#endif
