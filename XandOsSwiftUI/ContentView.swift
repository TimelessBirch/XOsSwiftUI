//
//  ContentView.swift
//  XandOsSwiftUI
//
//  Created by Brandon Trimm on 2020-08-25.
//  Copyright © 2020 BrandonTrimm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["blank", "ex", "circle"]
    @State private var boardNums = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var texts = "Tic-Tac-Toe"
    
    // True = X, False = O
    @State private var turn = true
    
    @State private var isWon = false
    
    var body: some View {
        
        ZStack {
            
            // The background
            Rectangle()
            .foregroundColor(.black)
            .edgesIgnoringSafeArea(.all)
            
            // The image of the board
            Image("board")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
                .padding(.all, 5)
            
            VStack(spacing: 30) {
                
                // The text at the top of the screen
                TextView(text: $texts)
                
                Spacer().frame(height: 35)
                
                // All nine buttons for the spaces on the board
                Group {
                
                    HStack(spacing: 35) {
                        
                        //
                        Button(action: {
                            
                            self.playTurn(self.turn, 0)

                        }) {
                            xoView(symbol: $symbols[boardNums[0]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 1)

                        }) {
                            xoView(symbol: $symbols[boardNums[1]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 2)

                        }) {
                            xoView(symbol: $symbols[boardNums[2]])
                        }
                        
                    }
                    
                    HStack(spacing: 35) {
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 3)

                        }) {
                            xoView(symbol: $symbols[boardNums[3]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 4)

                        }) {
                            xoView(symbol: $symbols[boardNums[4]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 5)

                        }) {
                            xoView(symbol: $symbols[boardNums[5]])
                        }
                        
                    }
                    
                    HStack(spacing: 35) {
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 6)

                        }) {
                            xoView(symbol: $symbols[boardNums[6]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 7)

                        }) {
                            xoView(symbol: $symbols[boardNums[7]])
                        }
                        
                        Button(action: {
                            
                            self.playTurn(self.turn, 8)

                        }) {
                            xoView(symbol: $symbols[boardNums[8]])
                        }
                        
                    }
                }
                
                Spacer().frame(height: 40)
                
                // Reset game button
                Button(action: {
                    
                    //print("Game reset")
                    self.boardNums = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                    self.turn = true
                    self.isWon = false
                    self.texts = "Tic-Tac-Toe"

                }) {
                    
                    Text("Reset Game")
                        .foregroundColor(.black)
                        .fontWeight(.black)
                        .padding(.all, 15)
                        .background(Color.white)
                        .cornerRadius(30)
                        .font(.system(size: 20))
                    
                }
                
            }
            
        }
        
    }
    
    // Handles the users input on the board
    func playTurn(_ turn:Bool, _ location:Int) {
        
        // Checks that the location pressed hasn't already been used
        if boardNums[location] == 0 && !isWon{
            if turn {
                boardNums[location] = 1
            }
            else {
                boardNums[location] = 2
            }
            
            // Checks if the game has been won
            processWin()
            
            // Changes whether it's X's or O's turn
            self.turn = !turn
            
        }
        
    }
    
    // Checks if there is a winning line on the board
    func processWin() {
        
        checkWin(0, 1, 2)
        checkWin(3, 4, 5)
        checkWin(6, 7, 8)
        checkWin(0, 3, 6)
        checkWin(1, 4, 7)
        checkWin(2, 5, 8)
        checkWin(0, 4, 8)
        checkWin(2, 4, 6)
        
        // If all spaces have been played and there's no winner
        if !boardNums.contains(0) && !isWon {
            self.texts = "No one wins!"
        }
        
    }
    
    // Checks if given locations is a winning line
    func checkWin(_ index1:Int, _ index2:Int, _ index3:Int) {
        
        //print("Checking win")
        // Checks if all locations given are the same value
        if boardNums[index1] == boardNums[index2] && boardNums[index2] == boardNums[index3] && boardNums[index1] != 0 {
            
            isWon = true
            
            if boardNums[index1] == 1 {
                // X is the winner
                self.texts = "X wins!"
            }
            else {
                // O is the winner
                self.texts = "O wins!"
            }
            
        }
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
