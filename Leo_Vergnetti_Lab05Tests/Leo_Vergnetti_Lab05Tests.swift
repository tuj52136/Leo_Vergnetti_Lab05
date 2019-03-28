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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPigInitSetsPlayerScoresToZero(){
        let game = PigModel()
        XCTAssert(game.getPlayer1Score() == 0, "player1score should = 0 on init")
        XCTAssert(game.getPlayer2Score() == 0, "Player 2 score should be 0 on init")
    }
    
    func testScoreAccumulatorShouldInitToZero(){
        let game = PigModel()
        XCTAssert(game.getScoreAccumulator() == 0, "Score Accumulator should init to 0")
    }
    
    func testRollDiceReturnsValueBetween1And6(){
        let dice = Dice()
        let roll = dice.rollDice()
        XCTAssert(roll <= 6 && roll >= 1,  "dice roll must be between 1 and 6")
    }
    
    func testPigShouldAddDieRollToAccumulator(){
        var game = PigModel()
        game.rollDice()
        XCTAssert(game.getScoreAccumulator() != 0, "Rolling the dice should add to accumulator")
    }
    
    func testPigShouldDefaultToPlayerOneTurn(){
        var game = PigModel()
        XCTAssert(game.isPlayer1Turn() == true, "Should init to player one's turn")
    }
    
    func testTurnEndShouldChangeToNextPlayerTurn(){
        var game = PigModel()
        game.endCurrentTurn()
        XCTAssert(game.isPlayer1Turn() == false, "Should now be player 2's turn after changing")
    }
    
    func testSequentialDiceRollsAddPointsToAccumulator(){
        var game = PigModel()
        game.rollDice()
        let dieValue1 = game.getScoreAccumulator()
        game.rollDice()
        let dieValue2 = game.getScoreAccumulator() - dieValue1
        XCTAssert(dieValue2 >= 1 && dieValue2 <= 6, "Accumulator is summing correctly")
    }
    
    func testTurnEndShouldAddPointsInAccumulatorToPlayer1ScoreOnPlayer1Turn(){
        var game = PigModel()
        game.rollDice()
        game.rollDice()
        game.rollDice()
        
        let accValue = game.getScoreAccumulator()
        game.endCurrentTurn()
        XCTAssert(game.getPlayer1Score() == accValue, "Ending a turn should add points to player 1's score")
    }
    
    func testTurnEndShouldZeroPointsInAccumulator(){
        var game = PigModel()
        game.rollDice()
        game.rollDice()
        
        game.endCurrentTurn()
        XCTAssert(game.getScoreAccumulator() == 0, "After Turn, the accumulator should be set to zero")
    }
    func testTurnEndShouldAddPointsInAccumulatorToPlayer2ScoreOnPlayer2Turn(){
        var game = PigModel()
        game.rollDice()
        game.endCurrentTurn()
        game.rollDice()
        let accValue = game.getScoreAccumulator()
        game.endCurrentTurn()
        XCTAssert(game.getPlayer2Score() == accValue, "Ending player 2's turn should add points to player 2's score")
    }
    

}
