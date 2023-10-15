//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func findMostFrequentAnimalType() -> Animal? {
        var animalCount: [Animal: Int] = [:]
        
        for answer in answers {
            let animal = answer.animal
            animalCount[animal] = (animalCount[animal] ?? 0) + 1
        }
        
        let mostFrequentType = animalCount.max(by: { $0.value < $1.value })?.key
        
        return mostFrequentType
    }
}
