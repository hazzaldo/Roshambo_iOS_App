//
//  scoreInfo.swift
//  Roshambo
//
//  Created by Hareth Naji on 22/07/2016.
//  Copyright © 2016 Hazzaldo. All rights reserved.
//

import Foundation

enum RPS {
    case Rock, Paper, Scissors
    
    // The init method randomly generates the opponent's move
    init() {
        switch arc4random() % 3 {
            
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
}
}

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            }
        }
    }
}