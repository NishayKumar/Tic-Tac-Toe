//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Nishay Kumar on 25/07/23.
//

import SwiftUI



struct ContentView: View {
    let column: [GridItem] = [GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isHumanTurn = true
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: column, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Circle()
                                .foregroundColor(.pink)
                                .opacity(colorScheme == .dark ? 1 : 0.7)
                                .frame(width: geometry.size.width/3 - 15, height: geometry.size.width/3 - 15)
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            
                        }
                        .onTapGesture {
                            moves[i] = Move(player: isHumanTurn ? .human : .computer, boardIndex: i)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
