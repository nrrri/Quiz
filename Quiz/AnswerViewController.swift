//
//  AnswerViewController.swift
//  Quiz
//
//  Created by Narissorn Chowarun on 2024-06-12.
//

import UIKit

class AnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionSets = QuestionData.shared.questionSets
       
        let margins = view.layoutMarginsGuide
        var previous: UILabel?
        for (question, answer) in questionSets {
            let labelQuestion = createLabel(prompt: "Question", value: question)
            let labelAnswer = createLabel(prompt: "Answer", value: answer)

            labelQuestion.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            labelQuestion.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            
            labelAnswer.leadingAnchor.constraint(equalTo: labelQuestion.trailingAnchor, constant: 4).isActive = true
            
            if let previous = previous {
                labelQuestion.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 4).isActive = true
                labelAnswer.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 4).isActive = true
            } else {
                labelQuestion.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
                labelAnswer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = labelQuestion
        }
    }
    
    func createLabel(prompt: String, value:String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(prompt): \(value)"
        
        self.view.addSubview(label)

        return label
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load heavy data
        self.view.backgroundColor = getRandomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // Random backgrond color
    func getRandomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256))/255.0
        let green = CGFloat(arc4random_uniform(256))/255.0
        let blue = CGFloat(arc4random_uniform(256))/255.0
        return UIColor(red:red, green:green, blue:blue, alpha: 1.0)
    }

}
