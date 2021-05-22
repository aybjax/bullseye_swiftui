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
    
    // User interface content and layout
    var body: some View {
        VStack {
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
//                    .fontWeight(.black)
//                    .foregroundColor(.blue)
                    .padding()
            }
            
            // Slider row
            // TODO: Add views for slider row here
            
            // Button row
            /**
             Button as in book
             */
//            Button(action: {}) {
//                Text("Hit me")
//            }
            /**
             Button with method
             */
//            Button("Hit me", action: self.btnPrsd)
            /**
             Button with callback and method chaining
             */
//            Button("Hit me") {
//                print("cb pressed")
//                self.alertIsVisible = true
//            }
//            .alert(isPresented: self.$alertIsVisible, content: {
//                Alert(
//                    title: Text("Hello there"),
//                    message: Text("This is my first pop-up"),
//                    dismissButton: .default(Text("Awesome!"))
//                )
//            })
            /**
             Alert as cb
             */
//            Button("Hit me", action: self.btnPrsd)
//            .alert(isPresented: self.$alertIsVisible) {
//                Alert(
//                    title: Text("Hello there"),
//                    message: Text("This is my first pop-up"),
//                    dismissButton: .default(Text("Awesome!"))
//                )
//            }
            /**
             presentation() instead of alert()
                property without self.
             */
            Button(action: {
                print("button pressed")
                self.alertIsVisible = true
            }) {
                Text("hit me!")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(
                    title: Text("Hello there"),
                    message: Text("This is my first pop-up"),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
            
            // Score row
            // Todo: Add views for score, rounds, start and info buttons here
        }
    }
    
    
    // Methods
    // =======
    
    func btnPrsd() {
        print("Button pressed!")
        self.alertIsVisible = true
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
