//
//  ContentView.swift
//  SwiftUIFirstSpel
//
//  Created by Lina Li on 2020-11-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var faces = ["happy", "sad", "excited", "worried"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...3)
    
//    @State private var score = 0
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack {
                ForEach((0...3), id: \.self) { number in
                    Image(self.faces[number])
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                        .border(Color.black, width: 2)
                        .onTapGesture {
                            faceTapped(tag: number)
                        }
                }
            }
            .navigationBarTitle(Text(faces[correctAnswer].uppercased()))
            .sheet(isPresented: $showingAlert, content: {
                Text(alertTitle)
            })
//            .presentation($showingAlert){
//                //showingalert here
//                Alert(title: Text(alertTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")))
//            }
        }
    }
    func faceTapped(tag: Int){
        if tag == correctAnswer {
//           right
            print("right")
//            score += 1
            alertTitle = "Correct"
            
        }else{
//            wrong
            print("wrong ")
//            score -= 1
            alertTitle = "Wrong"
        }
        showingAlert = true
    }
    
    func askQuestion(){
        faces.shuffle()
        correctAnswer = Int.random(in: 0...3)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
