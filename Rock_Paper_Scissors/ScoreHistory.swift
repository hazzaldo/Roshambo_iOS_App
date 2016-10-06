//
//  History.swift
//  Roshambo
//
//  Created by Hareth Naji on 22/07/2016.
//  Copyright © 2016 Hazzaldo. All rights reserved.
//

import Foundation

struct ScoreHistory {

    let status : String
    let choices : String
    let imageName : String
    
    static let StatusKey = "StatusKey"
     static let ChoicesKey = "ChoicesKey"
     static let ImageNameKey = "ImageNameKey"
    
    
    // Generate a Score from a three entry dictionary
    
    
    init(dictionary: [String : String]) {
        self.status = dictionary[ScoreHistory.StatusKey]!
        self.choices = dictionary[ScoreHistory.ChoicesKey]!
        self.imageName = dictionary[ScoreHistory.ImageNameKey]!
}
}

