//
//  PlayViewController.swift
//  RoShamBo
//
//  Created by Osama on 6/14/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var moves = ["rock", "paper", "scissors"]
    
    var move: String?
    
    @IBOutlet weak var rockButton: UIButton?
    @IBOutlet weak var paperButton: UIButton?
    @IBOutlet weak var scissorsButton: UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // generate opponents move
    func generateOpponentMove() -> String {
        
        let rvalue = Int(arc4random() % 3)
        return moves[rvalue]
    }
    
    // compare results
    func compareMoves(uMove : String, oMove: String) -> String {
        
        var result: String
        
        switch (uMove, oMove) {
        case ("rock", "scissors"), ("paper", "rock"), ("scissors", "paper"):
            result = "You win using \(uMove) vs \(oMove)!"
            
        case ("rock", "paper"), ("paper", "scissors"), ("scissors", "rock"):
            result = "You lose with \(uMove) vs \(oMove)!"
            
        case let (user, opponent) where user == opponent:
            result = "It's a tie with \(uMove) vs \(oMove)."
            
        default:
            result = "This shouldn't happen."
        }
        
        return result
    }
    
    // Rock using code only segue
    @IBAction func useRock() {
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        controller.result = compareMoves(uMove: "rock", oMove: generateOpponentMove())
        
        present(controller, animated: true, completion: nil)
    }
    
    // Paper using code + segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "usePaper" {
            
            let controller = segue.destination as! ResultsViewController
            
            controller.result = compareMoves(uMove: "paper", oMove: generateOpponentMove())
        }
        
        if segue.identifier == "useScissors" {
            
            let controller = segue.destination as! ResultsViewController
            
            controller.result = compareMoves(uMove: "scissors", oMove: generateOpponentMove())
        }
    }
    
    @IBAction func usePaper() {
        
        performSegue(withIdentifier: "usePaper", sender: self)
    }
    
    
    // Scissors using segue ONLY
    @IBAction func useScissors() {}

}

