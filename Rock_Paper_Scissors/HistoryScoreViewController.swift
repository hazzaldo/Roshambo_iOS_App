//
//  HistoryScoreViewController.swift
//  Roshambo
//
//  Created by Hareth Naji on 21/07/2016.
//  Copyright © 2016 Hazzaldo. All rights reserved.
//

import Foundation
import UIKit

class HistoryScoreViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var scoresHistory : [ScoreHistory]! 
    
    // Mark: Table View Data Source Methods
    
    /**
     * Number of Rows
     */
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.scoresHistory!.count
    }
    
    /**
     * Cell For Row At Index Path
     */
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("score")!
        let score = self.scoresHistory[indexPath.row]

        // Set the name and image
        cell.textLabel?.text = score.status
        cell.imageView?.image = UIImage(named: score.imageName)
        
        // If the cell has a detail label, we will put the choices of the two players.
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "\(score.choices)"
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    @IBAction func dismissHistoryScreen(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    }