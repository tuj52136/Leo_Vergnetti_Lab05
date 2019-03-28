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
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var holdButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

