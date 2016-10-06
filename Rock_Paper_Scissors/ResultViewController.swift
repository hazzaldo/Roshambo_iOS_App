//
//  ResultViewController.swift
//  Rock_Paper_Scissors
//
//  Created by Hareth Naji on 05/03/2016.
//  Copyright © 2016 Hazzaldo. All rights reserved.


import UIKit

class ResultViewController: UIViewController {

    var you : RPS!
    var computer : RPS!
    var model : Model!
    var controller : ViewController!
    var scoreArray : [ScoreHistory]?
    //var scoreInstance : ScoreHistory?
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var robotReact: UIImageView!
    

    override func viewDidLoad() {
        compare()
    }
    
   func compare() {
        var imageName : String!
        var robotImage : String!
        var text: String!
        var urScore : Int = 0
        var comScore : Int = 0
    var status : String!
        let win :String = "Win"
        let lose :String = "Loss"
        let tie :String = "Tie"
    
        //tie situation
        if you == computer {
            text = "It's a tie!"
            imageName = "itsATie"
            robotImage = "itsATie"
            status = tie
        }
        
        //You chose Rock
        if you == RPS.Rock{
            //Computer chose paper
            if computer == RPS.Paper{
                text =  "You lose. Computer chose paper. Paper covers rock."
                imageName = "PaperCoversRock"
                robotImage = "robotWin"
                comScore += 1
                status = lose
            }else{
                //Computer chose scissors
                if computer == RPS.Scissors{
                    text = "You win. Computer chose scissors. Rock crushes scissors."
                    imageName = "RockCrushesScissors"
                    robotImage = "robotCry"
                    urScore += 1
                    status = win
                }
            }
        }
        
            //You chose paper
            if you == RPS.Paper{
                //Computer chose rock
                if computer == RPS.Rock{
                    text = "You win. Computer chose rock. Paper covers rock."
                    imageName = "PaperCoversRock"
                    robotImage = "robotCry"
                    urScore += 1
                    status = win
            
                }else{
                    //Computer chose scissors
                    if computer == RPS.Scissors{
                        text = "You lose. Computer chose scissors. Scissors cuts paper."
                        imageName = "ScissorsCutPaper"
                        robotImage = "robotWin"
                        comScore += 1
                        status = lose
                    }
                }
            }
        
                //You chose scissors
                if you == RPS.Scissors{
                    //Computer chose rock
                    if computer == RPS.Rock{
                        text = "You lose. Computer chose rock. Rock crushes scissors."
                        imageName = "RockCrushesScissors"
                        robotImage = "robotWin"
                        comScore += 1
                        status = lose

                    }else{
                        //Computer chose paper
                        if computer == RPS.Paper{
                            text = "You win. Computer chose paper. Scissors cuts paper."
                            imageName =  "ScissorsCutPaper"
                            robotImage = "robotCry"
                            urScore += 1
                            status = win
                        }
                    }
                }
        
        resultImage.image = UIImage(named: imageName)
        robotReact.image = UIImage (named: robotImage)
        resultLabel.text = text
        model.yourScore = model.yourScore + urScore
        model.computerScore = model.computerScore + comScore
    
     let scores = ["StatusKey" : status!, "ChoicesKey" : "\(you.description) vs \(computer.description)", "ImageNameKey" : robotImage!]
    print ("ResultViewController score variable \(scores)")
    if scoreArray == nil {
         scoreArray = [ScoreHistory(dictionary: scores)]
        print ("ResultViewController - first time the scoreArray is being initialised because it's value is nil, value of scoreArray is: \(scoreArray)")
    } else{
        scoreArray?.append(ScoreHistory(dictionary: scores))
        print ("ResultViewController - this is not the first run, so scoreArray should have a value in it of \(scoreArray)")
    }
   
   // }else { print ("there was no value in ScoreHistory key values to assign to scoreArray variable") }
   
    }
    
    @IBAction func playAgain() {
        
        // Get the resultViewController
        var controller: ViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        controller.previousResultModel = model
        controller.scoreHistoryArray = self.scoreArray
        print ("ResultViewController - just before presenting ViewController, scoreArray value is \(scoreArray)")
        self.presentViewController(controller, animated: true, completion: nil)
    }
}