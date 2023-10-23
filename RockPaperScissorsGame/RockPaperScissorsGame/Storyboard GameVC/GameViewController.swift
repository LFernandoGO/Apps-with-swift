//
//  GameViewController.swift
//  RockPaperScissorsGame
//
//  Created by Diplomado on 16/10/23.
//  Developed by Luis Fernando Gutierrez Orozpe
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var pcSelectionImage: UIImageView!
    @IBOutlet weak var userSelectionImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var gameModeLabel: UILabel!
    @IBOutlet weak var nextTurnButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var computerOptions = ["circle.fill", "doc.fill", "scissors"]
    var computerChoice: String = ""
    var turnPlayed: Bool = false
    var userName: String = ""
    var gameMode: String = ""
    var rounds: Int = 1
    var points: Int = 0
    var numberOfRounds: Int = 0
    var pointsToWin: String = ""
    var winValue: String = ""
    var loseValue: String = ""
    var history: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if gameMode == "Round" {
            gameModeLabel.text = "\(gameMode): 1"
        } else {
            gameModeLabel.text = "\(gameMode): 0"
        }
        userNameLabel.text = "\(userName) selection"
        nextTurnButton.isHidden = true
    }
    
    @IBAction func rockButtonPressed(_ sender: UIButton){
        if gameMode == "Round" {
            userRockGame()
            rounds += 1
            updateUIrounds()
            checkGameRoundsCompleted()
        } else {
            userRockPointsGame()
            updateUIPoints()
            checkGamePointsCompleted()
        }
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton){
        if gameMode == "Round" {
            userPaperGame()
            rounds += 1
            updateUIrounds()
            checkGameRoundsCompleted()
        } else {
            userPaperPointsGame()
            updateUIPoints()
            checkGamePointsCompleted()
        }
        
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton){
        if gameMode == "Round" {
            userScissorsGame()
            rounds += 1
            updateUIrounds()
            checkGameRoundsCompleted()
        } else {
            userScissorsPointsGame()
            updateUIPoints()
            checkGamePointsCompleted()
        }
    }
    
    @IBAction func nextTurnButtonPressed(_ sender: UIButton){
        view.backgroundColor = UIColor.lightGray
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        nextTurnButton.isHidden = true
    }
    
    @IBAction func gameResetButtonPressed(_ sender: UIButton){
        if gameMode == "Round" {
            view.backgroundColor = UIColor.lightGray
            rounds = 1
            gameModeLabel.text = "\(gameMode): \(rounds)"
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        } else {
            view.backgroundColor = UIColor.lightGray
            points = 0
            gameModeLabel.text = "\(gameMode): \(points)"
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        }
    }
    
// MARK: - Go to the Game History
    
    @IBAction func gameHistoryButtonPressed(_ sender: UIButton){
        let historyViewController = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        historyViewController.history = history
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
// MARK: - Game By Rounds Logic
    
    func userRockGame(){
        userSelectionImage.image = UIImage(systemName: "circle.fill")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.green
            history = "\(history)You won\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.red
            history = "\(history)You Lose\n"
        } else {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        }
    }
    
    func userPaperGame(){
        userSelectionImage.image = UIImage(systemName: "doc.fill")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.red
            history = "\(history)You Lose\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        } else {
            view.backgroundColor = UIColor.green
            history = "\(history)You won\n"
        }
    }
    
    func userScissorsGame(){
        userSelectionImage.image = UIImage(systemName: "scissors")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.green
            history = "\(history)You won\n"
        } else {
            view.backgroundColor = UIColor.red
            history = "\(history)You Lose\n"
        }
    }
    
// MARK: - Game by Points Logic
    
    func userRockPointsGame(){
        userSelectionImage.image = UIImage(systemName: "circle.fill")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.green
            points = points + Int(winValue)!
            history = "\(history)You won\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.red
            checkNegativePoints()
            history = "\(history)You Lose\n"
        } else {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        }
    }
    
    func userPaperPointsGame(){
        userSelectionImage.image = UIImage(systemName: "doc.fill")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.red
            checkNegativePoints()
            history = "\(history)You Lose\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        } else {
            view.backgroundColor = UIColor.green
            points = points + Int(winValue)!
            history = "\(history)You won\n"
        }
    }
    
    func userScissorsPointsGame(){
        userSelectionImage.image = UIImage(systemName: "scissors")
        computerChoice = computerOptions.randomElement()!
        pcSelectionImage.image = UIImage(systemName: computerChoice)
        if computerChoice == "scissors" {
            view.backgroundColor = UIColor.systemBrown
            history = "\(history)Tied round\n"
        } else if computerChoice == "doc.fill" {
            view.backgroundColor = UIColor.green
            points = points + Int(winValue)!
            history = "\(history)You won\n"
        } else {
            view.backgroundColor = UIColor.red
            checkNegativePoints()
            history = "\(history)You Lose\n"
        }
    }
    
// MARK: - Aditional functions to Update UI and present alerts
    
    func updateUIrounds(){
        gameModeLabel.text = "\(gameMode): \(rounds)"
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        nextTurnButton.isHidden = false
    }
    
    func updateUIPoints(){
        gameModeLabel.text = "\(gameMode): \(points)"
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        nextTurnButton.isHidden = false
    }
    
    func presentAlertGameCompleted(){
        let alert = UIAlertController(title: "Game complete", message: "Push Game Reset to play again or go back to the configuration screen", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkGameRoundsCompleted(){
        if rounds > numberOfRounds {
            presentAlertGameCompleted()
            nextTurnButton.isHidden = true
            gameModeLabel.text = "Game completed"
        }
    }
    
    func checkGamePointsCompleted(){
        if points >= Int(pointsToWin)! {
            presentAlertGameCompleted()
            nextTurnButton.isHidden = true
            gameModeLabel.text = "Game completed"
        }
    }
    
    func checkNegativePoints(){
        if Int(loseValue)! > points {
            points = 0
        } else {
            points = points - Int(loseValue)!
        }
    }
}
