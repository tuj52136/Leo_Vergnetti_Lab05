//
//  Dice.swift
//  Leo_Vergnetti_Lab05Tests
//
//  Created by Leo Vergnetti on 3/28/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Dice {
    public static func roll() -> Int{
        return Int.random(in: 1...6)
    }
}
