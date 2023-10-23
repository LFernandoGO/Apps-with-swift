//
//  InfoViewController.swift
//  RockPaperScissorsGame
//
//  Created by Diplomado on 14/10/23.
//  Developed by Luis Fernando Gutierrez Orozpe
//

import UIKit

class InfoViewController: UIViewController {
    
    let rules: String = "A classic two-person game. Players start each round by saying, “rock, paper, scissors, shoot!” On “shoot,” each player holds out their fist for rock, flat hand for paper, or their index and middle finger for scissors. Rock crushes scissors, scissors cut paper, and paper covers rock. See who wins each round!"
    var name: String = ""
    
// MARK: - Create elements that will be displayed
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Game rules"
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.text = "Developed by: L. Fernando G.O"
        authorLabel.textAlignment = .center
        return authorLabel
    }()
    
    private lazy var rulesTextView: UITextView = {
        let rulesTextView = UITextView()
        rulesTextView.translatesAutoresizingMaskIntoConstraints = false
        rulesTextView.backgroundColor = UIColor(red: 199.0/255.0, green: 232.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        rulesTextView.text = rules
        rulesTextView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        rulesTextView.textAlignment = .justified
        return rulesTextView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 199.0/255.0, green: 232.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        setElements()
    }
    
// MARK: - Set elements and Constraints
    
    private func setElements(){
        view.addSubview(titleLabel)
        view.addSubview(rulesTextView)
        view.addSubview(authorLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            rulesTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            rulesTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            rulesTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            rulesTextView.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            authorLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            authorLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ])
    }

}
