//
//  FirstAppRayTests.swift
//  FirstAppRayTests
//
//  Created by Omar Khaled on 28/01/2022.
//

import XCTest

@testable import FirstAppRay

class FirstAppRayTests: XCTestCase {
    
    var game:Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
       game = nil
    }
    
    func testExample() throws {
        XCTAssertEqual(1, 1)
    }
    
    func testNewRound(){
        game.startNewRound(points:100)
        
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testRestart(){
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    
    func testLeaderboard(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
    
}
