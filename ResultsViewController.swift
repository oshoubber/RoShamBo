//
//  ResultsViewController.swift
//  RoShamBo
//
//  Created by Osama on 6/14/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultText: UILabel!
    var result: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resultText.text = result
    }
    
    @IBAction func playAgain(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
