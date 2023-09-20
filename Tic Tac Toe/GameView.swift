//
//  GameView.swift
//  Tic Tac Toe
//
//  Created by Nishay Kumar on 25/07/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var vm = GameViewModel()
    
    @Environment(\.colorScheme) var colorScheme
// • colorScheme is used to change the opacity of the matrix forground when it's in light mode (1 : 0.7) • looks good this way
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: vm.column, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry, colorScheme: colorScheme)
                            PlayerIndicator(systemImageName: vm.moves[i]?.indicator ?? "", colorScheme: colorScheme)
                        }
                        .onTapGesture {
                            vm.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(vm.isGameBoardDisabled)
            .padding()
            .alert(item: $vm.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle,action: { vm.resetGame() }))
            }
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
        GameView()
    }
}


struct GameSquareView:  View {
    
    var proxy: GeometryProxy
    var colorScheme: ColorScheme
    var body: some View {
        Circle()
            .foregroundColor(.pink)
            .opacity(colorScheme == .dark ? 1 : 0.7)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var colorScheme: ColorScheme
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
    }
}
