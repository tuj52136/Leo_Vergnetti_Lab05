//
//  PigModel.swift
//  Leo_Vergnetti_Lab05
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct PigModel {
    
    private var player1Score = 0
    private var player2Score = 0
    private var scoreAccumulator = 0
    private var currentTurn = 1
    
    
    public func getPlayer1Score() -> Int{
        return player1Score
    }
    public func getPlayer2Score() -> Int {
        return player2Score
    }
    public func getScoreAccumulator() -> Int{
        return scoreAccumulator
    }
    
    public mutating func updateCurrentPlayerScore(increaseScoreBy amount: Int, for player: Int){
        if player == 1 {
            player1Score += amount
        }else {
            player2Score += amount
        }
    }
    
    
    
    public mutating func isPlayer1Turn() -> Bool{
        return currentTurn == 1
    }
    
    public mutating func endCurrentTurn(){
        if currentTurn == 1{
            player1Score += scoreAccumulator
        }else{
            player2Score += scoreAccumulator
        }
        scoreAccumulator = 0
        currentTurn = currentTurn == 1 ? 2 : 1
    }
}
