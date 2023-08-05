//
//  Alerts.swift
//  Tic Tac Toe
//
//  Created by Nishay Kumar on 06/08/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                    message: Text("You are smart"),
                    buttonTitle: Text("Hell yeah"))
    
    static let computerWin = AlertItem(title: Text("Computer Wins!"),
                    message: Text("You lost to a Super AI?!"),
                    buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw!"),
                    message: Text("Try again"),
                    buttonTitle: Text("Restart"))
}
