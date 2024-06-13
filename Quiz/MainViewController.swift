//
//  ViewController.swift
//  Quiz
//
//  Created by Narissorn Chowarun on 2024-06-12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
    
    // question and answer sets --> change to dictionary / enum
    // challenge 5

    let questionSets:[String: String] = [
        "What is the capital city of Australia?" : "Canberra",
        "Who wrote the play \"Hamlet\"?" :"William Shakespeare",
        "What is the chemical symbol for the element gold?":"Au",
        "In which year did the Titanic sink?": "1912",
        "What is the largest planet in our solar system?":"Jupiter"
    ]
    
    var questions: [String] {
        return Array(questionSets.keys)
    }
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // challenge 1
        self.view.backgroundColor = getRandomColor()
        
        // round button corner -------------------
        questionButton.layer.cornerRadius = 12
        questionButton.layer.masksToBounds = true
        
        answerButton.layer.cornerRadius = 12
        answerButton.layer.masksToBounds = true
        // ---------------------------------------
        
        questionLabel.text = "I'm a question"
        answerLabel.text = "I'm an answer"
        
    }
    
    // Random backgrond color
    func getRandomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255.0
        let green = CGFloat(arc4random_uniform(256))/255.0
        let blue = CGFloat(arc4random_uniform(256))/255.0
        return UIColor(red:red, green:green, blue:blue, alpha: 1.0)
    }
    
   
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        
        if (currentQuestionIndex >= questions.count) {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }
    

    @IBAction func showAnswer(_ sender: UIButton) {
        let question = questions[currentQuestionIndex]
        let answer = questionSets[question] ?? "Answer Not Found"
        answerLabel.text = answer
        currentQuestionIndex += 1
       
    }
}

