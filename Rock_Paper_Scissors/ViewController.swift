//
//  ViewController.swift
//  Rock_Paper_Scissors
//
//  Created by Hareth Naji on 05/03/2016.
//  Copyright © 2016 Hazzaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var previousResultModel = Model()
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var comScore: UILabel!
    var scoreHistoryArray :[ScoreHistory]? = [ScoreHistory]()
    
    func randomNum() -> Int{
        var randomiser = 1 + arc4random() % 3
        return Int(randomiser)
    }
    
    override func viewWillAppear(animated: Bool) {
        print ("In ViewController scoresHistoryArray variable value is - \(scoreHistoryArray)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("In ViewController scoresHistoryArray variable value is - \(scoreHistoryArray)")
        self.yourScore.text = String (previousResultModel.yourScore)
        self.comScore.text = String (previousResultModel.computerScore)
        if (previousResultModel.yourScore > 0) || (previousResultModel.computerScore > 0) {
            self.yourScore.text = String (previousResultModel.yourScore)
            self.comScore.text = String (previousResultModel.computerScore)
        }else {
            print("no score")
        }
       
    
        }
    

    
    //reset scores
    @IBAction func resetScores(sender: UIButton) {
        previousResultModel.yourScore = 0
        previousResultModel.computerScore = 0
        self.yourScore.text = String ("0")
        self.comScore.text = String ("0")
    }

    //rock choice
    @IBAction func rockChoice() {
        // Get the resultViewController
        var resultController: ResultViewController
        resultController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        resultController.you = RPS.Rock
        resultController.computer = RPS()
        resultController.model = previousResultModel
        resultController.scoreArray = scoreHistoryArray
        print ("ViewController - before presenting ResultViewController, value of scoreHistory scoreHistoryArray \(scoreHistoryArray)")
        self.presentViewController(resultController, animated: true, completion: nil)
    }
    
    //paper choice
    @IBAction func paperChoice(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    
    //scissors choice
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var resultController: ResultViewController
        if segue.identifier == "play"{
            resultController = segue.destinationViewController as! ResultViewController
            //check if paper or scissors was chosen by user
            if paperButton.touchInside {
                resultController.you = RPS.Paper
            }else{
                resultController.you = RPS.Scissors
            }
            resultController.computer = RPS()
            resultController.model = previousResultModel
            resultController.scoreArray = scoreHistoryArray
            print ("ViewController - before presenting ResultViewController, value of scoreHistory scoreHistoryArray \(scoreHistoryArray)")
        }
        if segue.identifier == "HistoryScore"{
            print ("HistoryScore segue triggered")
            let controller = segue.destinationViewController as! HistoryScoreViewController
            if let scoreHistory = scoreHistoryArray  {
                print ("ViewController - Just about to present HistoryScore ViewController, as there's apparently a value in scoreHistoryArray according to the check, value is: \(scoreHistoryArray)")
            controller.scoresHistory = scoreHistory
            }else { print ("no value in scoreHistory array")
            }
        }
    }
    
   
    
    //Score history button
    
    @IBAction func scoreHistoryButton(sender: UIButton) {
         performSegueWithIdentifier("HistoryScore", sender: sender)
    }
   
    
}











