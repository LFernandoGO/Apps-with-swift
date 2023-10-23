//
//  ViewController.swift
//  RockPaperScissorsGame
//
//  Created by Diplomado on 14/10/23.
//  Developed by Luis Fernando Gutierrez Orozpe
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var winValueLabel: UILabel!
    @IBOutlet weak var loseValueLabel: UILabel!
    @IBOutlet weak var scoreToWinLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var winTextField: UITextField!
    @IBOutlet weak var loseTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var roundsSlider: UISlider!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var segmentCase: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
        winValueLabel.isHidden = true
        winTextField.isHidden = true
        loseTextField.isHidden = true
        loseValueLabel.isHidden = true
        scoreToWinLabel.isHidden = true
        scoreTextField.isHidden = true
        roundsLabel.text = "Number of rounds: 1"
    
    }
    
    @IBAction func segmentedControllerChanged(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            winValueLabel.isHidden = true
            winTextField.isHidden = true
            loseTextField.isHidden = true
            loseValueLabel.isHidden = true
            scoreToWinLabel.isHidden = true
            scoreTextField.isHidden = true
            roundsLabel.isHidden = false
            roundsSlider.isHidden = false
            segmentCase = true
        case 1:
            winValueLabel.isHidden = false
            winTextField.isHidden = false
            loseTextField.isHidden = false
            loseValueLabel.isHidden = false
            scoreToWinLabel.isHidden = false
            scoreTextField.isHidden = false
            roundsLabel.isHidden = true
            roundsSlider.isHidden = true
            continueButton.isEnabled = false
            segmentCase = false
        default:
            break
        }
    }
    
    @IBAction func roundsSliderChanged(_ sender: UISlider){
        roundsLabel.text = "Number of rounds: \(String(Int(roundsSlider.value)))"
    }
    
    @IBAction func winTextFieldEditingChanged(_ sender: UITextField){
        changeContinueButton()
    }
    
    @IBAction func loseTextFieldEditingChanged(_ sender: UITextField){
        changeContinueButton()
    }
    
    @IBAction func scoreTextFieldEditingChanged(_ sender: UITextField){
        changeContinueButton()
    }
    
    @IBAction func nameTextFieldEditingChanged(_ sender: UITextField){
        if segmentCase{
            if nameTextField.text == "" {
                continueButton.isEnabled = false
            } else {
                continueButton.isEnabled = true
            }
        } else {
            changeContinueButton()
        }
    }
    
    func changeContinueButton(){
        if nameTextField.text == "" || winTextField.text == "" || loseTextField.text == "" || scoreTextField.text == "" {
            continueButton.isEnabled = false
        } else {
            continueButton.isEnabled = true
        }
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton){
        let infoViewController = InfoViewController()
        infoViewController.title = "Information"
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton){
        guard let gameViewController = UIStoryboard(name: "GameViewController", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
        if segmentCase{
            gameViewController.title = "Game by Rounds"
            gameViewController.gameMode = "Round"
            gameViewController.numberOfRounds = Int(roundsSlider.value)
        } else {
            gameViewController.title = "Game by Points"
            gameViewController.gameMode = "Points"
            gameViewController.pointsToWin = scoreTextField.text!
            gameViewController.winValue = winTextField.text!
            gameViewController.loseValue = loseTextField.text!
        }
        gameViewController.userName = nameTextField.text!
        navigationController?.pushViewController(gameViewController, animated: true)
    }


}

