//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var firstLineLabel: UILabel!
  
    var answers: [Answer] = []
    private var dogAnswers = 0
    private var catAnswers = 0
    private var rabbitAnswers = 0
    private var turtleAnswers = 0
    
    private var animal: Character = " "
    private var definition: String = ""
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        makeDescription()
        firstLineLabel.text = "Вы - \(animal)!"
        resultsLabel.text = definition
    }
}

//MARK: - Private Methods
extension ResultsViewController {
    
    private func findBiggest(array: [Int]) -> Int {
        var biggestElement = array.first!
        var biggestIndex = 0
        for index in 1...array.count - 1 {
            if array[index] > biggestElement {
                biggestElement = array[index]
                biggestIndex = index
            }
        }
        return biggestIndex
    }
    
    private func findResult() -> String {
        for answer in answers {
            if answer.type == .dog {
                dogAnswers += 1
            } else if answer.type == .cat {
                catAnswers += 1
            } else if answer.type == .rabbit {
                rabbitAnswers += 1
            } else {
                turtleAnswers += 1
            }
        }
        let results = [dogAnswers, catAnswers, rabbitAnswers, turtleAnswers]
        let indexOfBiggest = findBiggest(array: results)
        if results[indexOfBiggest] == dogAnswers {
            return "dog"
        } else if results[indexOfBiggest] == catAnswers {
            return "cat"
        } else if results[indexOfBiggest] == rabbitAnswers {
            return "rabbit"
        } else {
            return "turtle"
        }
    }
    
    private func makeDescription() {
        let result = findResult()
        
        if result == "dog" {
            animal = AnimalType.dog.rawValue
            definition = AnimalType.dog.definition
        } else if result == "cat" {
            animal = AnimalType.cat.rawValue
            definition = AnimalType.cat.definition
        } else if result == "rabbit" {
            animal = AnimalType.rabbit.rawValue
            definition = AnimalType.rabbit.definition
        } else {
            animal = AnimalType.turtle.rawValue
            definition = AnimalType.turtle.definition
        }
    }
}

