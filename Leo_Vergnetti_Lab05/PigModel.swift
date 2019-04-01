//
//  PigModel.swift
//  Leo_Vergnetti_Lab05
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct PigModel {
    
    private var scores = [0, 0]
    private var scoreAccumulator = 0
    private var currentTurn = 1
    public func getScore(forPlayer player: Int) -> Int{
        return scores[player - 1]
    }
    public func getScoreAccumulator() -> Int{
        return scoreAccumulator
    }
    
    public mutating func updateCurrentPlayerScore(){
        scores[currentTurn - 1] += scoreAccumulator
    }
    
    public mutating func isPlayer1Turn() -> Bool{
        return currentTurn == 1
    }
    
    public mutating func endCurrentTurn(){
        updateCurrentPlayerScore()
        scoreAccumulator = 0
        currentTurn = currentTurn == 1 ? 2 : 1
    }
    
    public mutating func processRoll(playerRolled dice : Int){
        if dice != 1{
            scoreAccumulator += dice
        } else {
            scoreAccumulator = 0
            endCurrentTurn()
        }
    }
}
