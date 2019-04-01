//
//  Leo_Vergnetti_Lab05Tests.swift
//  Leo_Vergnetti_Lab05Tests
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import XCTest
@testable import Leo_Vergnetti_Lab05

class Leo_Vergnetti_Lab05Tests: XCTestCase {
    var game = PigModel()
    override func setUp() {
        game = PigModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func rollMultiple(diceValue : Int, numberOfRolls: Int){
        for _ in 1 ... numberOfRolls {
            game.processRoll(playerRolled: diceValue)
        }
    }
    
    func testPigInitSetsPlayerScoresToZero(){
        
        XCTAssert(game.getScore(forPlayer: 1) == 0, "player1score should = 0 on init")
        XCTAssert(game.getScore(forPlayer: 2) == 0, "Player 2 score should be 0 on init")
        XCTAssert(game.getScoreAccumulator() == 0, "Score Accumulator should init to 0")
    }
    
    func testRollDiceReturnsValueBetween1And6(){
        for _ in 1 ... 25{
            let roll = Dice.roll()
            XCTAssert(roll <= 6 && roll >= 1,  "dice roll must be between 1 and 6")
        }
    }
    
    func testPigShouldAddDieRollToAccumulator(){
        game.processRoll(playerRolled: 2)
        XCTAssert(game.getScoreAccumulator() == 2, "Rolling the dice should add to accumulator")
    }
    
    func testPigShouldDefaultToPlayerOneTurn(){
        var game = PigModel()
        XCTAssert(game.isPlayer1Turn() == true, "Should init to player one's turn")
    }
    
    func testTurnEndShouldChangeToNextPlayerTurn(){
        game.endCurrentTurn()
        XCTAssert(game.isPlayer1Turn() == false, "Should now be player 2's turn after changing")
    }
    
    func testSequentialDiceRollsSumPointsInAccumulator(){
        rollMultiple(diceValue: 2, numberOfRolls: 2)
        XCTAssert(game.getScoreAccumulator() == 4, "Accumulator is summing correctly")
    }
    
    func testTurnEndShouldAddPointsInAccumulatorToPlayer1ScoreOnPlayerTurnAndZeroPointsInAccumulator(){
        for i in 1 ... 2{
            rollMultiple(diceValue: 2, numberOfRolls: 2)
            game.endCurrentTurn()
            XCTAssert(game.getScore(forPlayer: i) == 4, "Ending a turn should add 4 points to player 1's score")
            XCTAssert(game.getScoreAccumulator() == 0, "After Turn, the accumulator should be set to zero")
        }
    }

    func testTurnEndShouldAddPointsInAccumulatorToPlayer2ScoreOnPlayer2Turn(){
        game.endCurrentTurn()
        game.processRoll(playerRolled: 2)
        game.endCurrentTurn()
        XCTAssert(game.getScore(forPlayer: 2) == 2, "Ending player 2's turn should add points to player 2's score")
    }
    
    func testDieRollOf1EndsCurrentPlayerTurn(){
        game.processRoll(playerRolled: 2)
        game.processRoll(playerRolled: 1)
        XCTAssert(game.isPlayer1Turn() == false, "Player 1 rolled a 1 and now it is player 2's turn")
    }
    
    func testDieRollOf1DoesNotAddAccumulatorToPlayerScore(){
        game.processRoll(playerRolled: 2)
        game.processRoll(playerRolled: 1)
        XCTAssert(game.getScore(forPlayer: 1) == 0, "Player 1 rolled a 1 and now gets no points")
        XCTAssert(game.getScoreAccumulator() == 0, "Accumulator is properly zeroed out")
    }
    
    
}
