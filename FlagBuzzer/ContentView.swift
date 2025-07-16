//
//  ContentView.swift
//  FlagBuzzer
//
//  Created by Arman on 16/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State var countries = ["France", "Germany", "Italy", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                
                ForEach(0..<3){number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
            
        }
        .alert(scoreTitle, isPresented: $showScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(scoreTitle)")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        }
        else{
            scoreTitle = "Wrong"
        }
        
        showScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
