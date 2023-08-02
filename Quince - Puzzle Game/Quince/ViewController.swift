//
//  ViewController.swift
//  Quince
//
//  Created by Luis Fernando Gutierrez on 31/07/23.
//

import UIKit

class ViewController: UIViewController {

    // Create a 4x4 grid of UIImageViews (you can use Interface Builder or programmatically create them)
        
    @IBOutlet var imageViews: [UIImageView]!
    
    let referenceImageName = "16"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load images into the UIImageViews
        for i in 0..<imageViews.count {
            let imageName = "\(i + 1)"
            imageViews[i].image = UIImage(named: imageName)
            imageViews[i].image?.accessibilityIdentifier = "\(i + 1)"
            // Set the accessibilityIdentifier as the name of the image
        }

        // Tap gesture recognizer
        for imageView in imageViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
        }
    }

    // Handle tap gestures on UIImageViews
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedImageView = sender.view as? UIImageView else { return }

        // Find the index of the tapped image view in the array
        guard let tappedIndex = imageViews.firstIndex(of: tappedImageView) else {
            return
        }

        // Find the index of the image view containing the reference image in the array
        guard let referenceIndex = imageViews.firstIndex(where: { $0.image?.accessibilityIdentifier == referenceImageName }) else {
            return
        }

        // Check if the tapped image view is adjacent to the reference image view
        if isAdjacent(tappedIndex, referenceIndex) {
            // Perform the tile swap
            let tempImage = tappedImageView.image
            tappedImageView.image = imageViews[referenceIndex].image
            imageViews[referenceIndex].image = tempImage
            
            if isPuzzleSolved(){
                
                showAlert()
            }
        }
    }
    
    func isAdjacent(_ index1: Int, _ index2: Int) -> Bool {
        let row1 = index1 / 4
        let col1 = index1 % 4
        let row2 = index2 / 4
        let col2 = index2 % 4

        // Check if the two tiles are adjacent horizontally or vertically
        return abs(row1 - row2) + abs(col1 - col2) == 1
    }

    // Verify the puzzle is solved
    func isPuzzleSolved() -> Bool {
        var cont = 0
        for i in 0..<self.imageViews.count{
            if imageViews[i].image?.accessibilityIdentifier == "\(i+1)"{
                cont += 1
            }
        }
        if cont == 16{
            print(cont)
            return true
        } else {
            print(cont)
            return false
        }
    }
    
    // To Shuffle the tiles to start/restar the game
    @IBAction func suffleButton(_ sender: UIButton) {
        let shuffledImages = imageViews.map {$0.image}.shuffled()
        
        for i in 0..<imageViews.count{
            imageViews[i].image = shuffledImages[i]
        }
    }
    
    // To display the alert when the user completed the puzzle
    func showAlert(){
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: "YOU WIN", message: "Well DONE! :)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        })
    }
}

