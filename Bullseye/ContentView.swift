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
    static let midnight_blue = Color(red: 0, green: 0.2, blue: 0.4)
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
                    .modifier(LabelStyle())
                Text("\(target)")
                    .modifier(ValueStyle())
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                    .modifier(LabelStyle())
//                Slider(value: Binding.constant(100))
//                Slider(value: .constant(100))
                Slider(value: $sliderValue, in: 1...100)
                    .accentColor(.green)
                Text("100")
                    .modifier(LabelStyle())
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                print("button pressed")
                alertIsVisible = true
            }) {
                Text("Hit me!")
                    .modifier(ButtonLargeTextStyle())
            }
            .background(
                Image("Button-Normal")
                    .modifier(Shadow())
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
                Button(action: {
                    startGame()
                }) {
                    Image("StartOverIcon")
                    Text("Start over").modifier(ButtonSmallTextStyle())
                }
                .background(Image("Button-Highlighted")
                                .modifier(Shadow()))
                
                Spacer()
                
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                
                Spacer()
                
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                
                Button(action:{}) {
                    Image("InfoButton")
                    Text("Info").modifier(ButtonSmallTextStyle())
                        .padding(.trailing)
                }
                .background(Image("Button-Highlighted")
                                .modifier(Shadow()))
            }
            .padding(.bottom, 20)
            .accentColor(ContentView.midnight_blue)
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


// View modifiers
// ==============
struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.white)
            .modifier(Shadow())
    }
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.black)
    }
}

struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(Color.black)
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
