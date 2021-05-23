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
    static let max_score = 100
    var sliderInt: Int {
        Int(
            sliderValue.rounded()
        )
    }
    
    var pointsForCurrentRound: Int {
        let diff = abs(target - sliderInt)
        
        if(diff == 0) {
            return 200
        }
        else if diff == 1 {
            return 150
        }
        
        return ContentView.max_score - diff
    }
    
    var scoringMessage: String {
        "The slider value is \(sliderInt).\n" +
        "The target value is \(target).\n" +
        "You scored \(pointsForCurrentRound) points this round."
    }
    
    var alertTitle: String {
        let diff = abs(target - sliderInt)
        let title: String
        
        if diff == 0 {
            title = "Perfect"
        }
        else if diff < 5 {
            title = "You almost had it"
        }
        else if diff <= 10 {
            title = "Not bad"
        }
        else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    // User interface views
    @State var alertIsVisible = false
    @State var sliderValue: Double = Double.random(in: 1...100)
//    @State var target: Int = .random(in: 1...100)
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 0
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                    .padding()
                Text("\(target)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                    .foregroundColor(Color.yellow)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
//                Slider(value: Binding.constant(100))
//                Slider(value: .constant(100))
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                print("button pressed")
                alertIsVisible = true
            }) {
                Text("Hit me!")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.black)
            }
            .background(
                Image("Button-Normal")
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            )
            .alert(isPresented: self.$alertIsVisible) {
                Alert(
                    title: Text("\(alertTitle)"),
                    message: Text(
                        scoringMessage
                    ),
                    dismissButton: .default(Text("Awesome!")) {
                        newRound()
                    }
                )
            }
            
            Spacer()
            
            // Score row
            HStack {
                Button("Start over") {
                    startGame()
                }
                
                Spacer()
                
                Text("Score:")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(score)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                
                Spacer()
                
                Text("Round:")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(round)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                
                Spacer()
                
                Button(action:{}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        .onAppear() {
            self.startGame()
        }
        .background(
            Image("Background")
                .resizable()
                .scaledToFill()
        )
    }
    
    
    // Methods
    // =======
    
    func btnPrsd() {
        print("Button pressed!")
        self.alertIsVisible = true
    }
    
    func startGame() {
        score = 0
        round = 1
        sliderValue = 50
        target = .random(in: 1...100)
        sliderValue = Double.random(in: 1...100)
    }
    
    func newRound() {
        score += pointsForCurrentRound
        target = .random(in: 1...100)
        round += 1
        sliderValue = Double.random(in: 1...100)
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
