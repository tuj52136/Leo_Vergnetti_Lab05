//
//  ViewController.swift
//  Leo_Vergnetti_Lab05
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1Label: UILabel!
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
            prepareNextTurn()
        }
    }
    
    fileprivate func prepareNextTurn() {
        continueButton.setTitle("Tap To Continue", for: .normal)
        continueButton.isEnabled = false
        rollButton.isEnabled = true
        holdButton.isEnabled = true
        accumulatorLabel.text = "Turn Total: \(game.getScoreAccumulator())"
        updateScoreUI()
        diceImageView.image = nil
    }
    
    func startANewGame(){
        diceImageView.image = nil
        gameInProgress = true
        game = PigModel()
        prepareNextTurn()
    }
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let roll = Dice.roll()
        //TODO: Render dice image of roll
        diceImageView.image = UIImage(named: "Dice\(roll)")
        print("Player rolled \(roll)")
        game.processRoll(playerRolled: roll)
        if game.testVictory() {
            updateUIForGameOver()
        }else{
            updateAccumulator()
            if roll == 1{
                updateUIForTurnEnded()
                displayResultsMessage()
            }
        }
    }
    
    @IBAction func holdButtonPressed(_ sender: UIButton) {
        let points = game.getScoreAccumulator()
        game.endCurrentTurn()
        displayResultsMessage(pointsScored : points)
        updateUIForTurnEnded()
        updateScoreUI()
        
    }
    
    func updateAccumulator(){
        accumulatorLabel.text = "Turn Total: \(game.getScoreAccumulator())"
    }
    func updateScoreUI(){
        let player1Score = game.getScore(forPlayer: 1)
        let player2Score = game.getScore(forPlayer: 2)
        player1ScoreProgress.setProgress(Float(player1Score) / 100.0, animated: true)
        player2ScoreProgress.setProgress(Float(player2Score) / 100.0, animated: true)
        player1ScoreLabel.text = "\(player1Score)"
        player2ScoreLabel.text = "\(player2Score)"
    }
    
    func updateUIForTurnEnded(){
        continueButton.isEnabled = true
        rollButton.isEnabled = false
        holdButton.isEnabled = false
    }
    
    func displayResultsMessage(pointsScored points : Int = 0){
        let previousPlayer = game.isPlayer1Turn() ? 2 : 1
        accumulatorLabel.text = "Player \(previousPlayer) scored \(points) points!"
    }
    
    func updateUIForGameOver(){
        print("The game is over!")
        game.endCurrentTurn()
        updateUIForTurnEnded()
        updateScoreUI()
        let previousPlayer = game.isPlayer1Turn() ? 2 : 1
        accumulatorLabel.text = "Congratulations! Player \(previousPlayer) WINS!"
        gameInProgress = false
        continueButton.setTitle("New Game", for: .normal)
    }
}

