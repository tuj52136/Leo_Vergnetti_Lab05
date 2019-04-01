//
//  ViewController.swift
//  Leo_Vergnetti_Lab05
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player1ScoreProgress: UIProgressView!
    @IBOutlet weak var player2ScoreProgress: UIProgressView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var holdButton: UIButton!
    @IBOutlet weak var accumulatorLabel: UILabel!
    var gameInProgress = false
    var game = PigModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.isEnabled = false
        holdButton.isEnabled = false
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if !gameInProgress {
            startANewGame()
        } else{
            
        }
    }
    
    func startANewGame(){
        gameInProgress = true
        game = PigModel()
        continueButton.setTitle("Tap To Continue", for: .normal)
        continueButton.isEnabled = false
        rollButton.isEnabled = true
        holdButton.isEnabled = true
        updateView()
    }
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let roll = Dice.roll()
        //TODO: Render dice image of roll
        print("Player rolled \(roll)")
        game.processRoll(playerRolled: roll)
        updateView()
    }
    
    @IBAction func holdButtonPressed(_ sender: UIButton) {
        
    }
    
    func updateView(){
        accumulatorLabel.text = "Turn Total: \(game.getScoreAccumulator())"
        player1ScoreProgress.setProgress(Float(game.getScore(forPlayer: 1)) / 100.0, animated: true)
        player2ScoreProgress.setProgress(Float(game.getScore(forPlayer: 2)) / 100.0, animated: true)
    }
}

