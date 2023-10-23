//
//  HistoryViewController.swift
//  RockPaperScissorsGame
//
//  Created by Diplomado on 19/10/23.
//  Developed by Luis Fernando Gutierrez Orozpe
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyTextView: UITextView!
    var history: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.text = history
        
    }
    

}
