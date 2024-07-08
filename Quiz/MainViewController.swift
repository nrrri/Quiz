//
//  ViewController.swift
//  Quiz
//
//  Created by Narissorn Chowarun on 2024-06-12.
//

import UIKit


class QuestionData {
    static let shared = QuestionData()
    
    // challenge 5
    let questionSets: [String: String] = [
        "What is the capital city of Australia?" : "Canberra",
        "Who wrote the play \"Hamlet\"?" :"William Shakespeare",
        "What is the chemical symbol for the element gold?":"Au",
        "In which year did the Titanic sink?": "1912",
        "What is the largest planet in our solar system?":"Jupiter"
    ]
    
    private init() {}
}

class MainViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
    
    let questionSets = QuestionData.shared.questionSets
    
    var questions: [String] {
        return Array(questionSets.keys)
    }
    
    // challenge 3
    var currentQuestionIndex: Int = 0 {
        didSet {
            setCurrentQuestionIndex()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // round button corner -------------------
        questionButton.layer.cornerRadius = 12
        questionButton.layer.masksToBounds = true
        
        answerButton.layer.cornerRadius = 12
        answerButton.layer.masksToBounds = true
        // ---------------------------------------
        
        questionLabel.text = "I'm a question"
        answerLabel.text = "I'm an answer"
        
    }
    
    // challenge 2
    override func viewDidDisappear(_ animated: Bool) {
        print("View dissapeared")
    }
   
    func setCurrentQuestionIndex() {
        if (currentQuestionIndex >= questions.count) {
            currentQuestionIndex = 0
        }
            
        
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }
    

    @IBAction func showAnswer(_ sender: UIButton) {
        let question = questions[currentQuestionIndex]
        let answer = questionSets[question] ?? "Answer Not Found"
        answerLabel.text = answer
       
    }
}

