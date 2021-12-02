//
//  ContentView.swift
//  SelectionStatementExample
//
//  Created by Judy Yu on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    
    @State var number: Double = 61
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Group {
                
                Slider(value: $number,
                       in: 0...100,
                       step: 1,
                       label: {
                    Text("Height")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                
                HStack {
                    Spacer()
                    Text("\(String(format:"%.0f", number))")
                        .font(.title2)
                        .bold()
                    Spacer()
                }

            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    print("Button was pressed")
                }, label: {
                    Text("Submit Guess")
                })
                    .buttonStyle(.bordered)
                    .padding(.top, 10)
                
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
