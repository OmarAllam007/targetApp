//
//  Game.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 28/01/2022.
//

import Foundation


struct LeaderBoardEntry{
    let score:Int
    let date:Date
}
struct Game {
    var round:Int = 1
    var score:Int = 0
    var target:Int = Int.random(in: 1...100)
    var leaderboardEntries:[LeaderBoardEntry] = []
    
    
    func getPoints(value:Int) -> Int {
        let difference = abs( target - value)
        var bonus:Int = 0
        
        if(difference == 0){
            bonus = 100
        }else if(difference <= 2){
            bonus = 50
        }else{
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    
    mutating func startNewRound(points:Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
        
        leaderboardEntries.append(LeaderBoardEntry(score: score, date: Date()))
        leaderboardEntries.sort(by: { $0.score > $1.score })
    }
    
    mutating func restart(){
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
}
