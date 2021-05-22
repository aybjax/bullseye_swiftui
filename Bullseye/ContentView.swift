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
    
    // User interface views
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                    .padding()
                Text("100")
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
                    message: Text("The slider value is \(sliderInt)."),
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
    
    var sliderInt: Int {
        return Int(
            sliderValue.rounded()
        )
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
