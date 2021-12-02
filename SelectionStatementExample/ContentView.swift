//
//  ContentView.swift
//  SelectionStatementExample
//
//  Created by Judy Yu on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored properties
    //current guess of user
    @State var currentGuess: Double = 61
    
    //The target we are trying to get
    //random number from 1 to 100
    let target = Int.random(in: 1...100)
    
    //feedback
    @State var feedback = "Take a guess!" //No hint to start the game
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Group {
                
                Slider(value: $currentGuess,
                       in: 0...100,
                       step: 1,
                       label: {
                    Text("Current Guess")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                
                HStack {
                    Spacer()
                    Text("\(String(format:"%.0f", currentGuess))")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                
            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                    //make user's guess (Double) into an Int
                    let currentGuessAsInteger = Int(currentGuess)
                    
                    //Compare current guess to the target
                    if currentGuessAsInteger < target {
                        //guess higher
                        feedback = "Guess higher"
                    } else if currentGuessAsInteger > target {
                        //guess lowerer
                        feedback = "Guess lower"
                    } else {
                        feedback = "You got it!"
                    }
                    
                    print("Button was pressed")
                }, label: {
                    Text("Submit Guess")
                })
                    .buttonStyle(.bordered)
                    .padding(.top, 10)
                
                Spacer()
            }
            
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("The super secret target is \(target)")
                        .padding(.bottom, 20)
                    
                    Text(feedback)
                        .italic()
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .navigationTitle("Guessing Game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
