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
       
        for (question, answer) in questionSets {
            let label = createLabel(question: question, answer: answer)
            label.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            
        }
    }
    
    func createLabel(question: String, answer: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Question: \(question) \n Answer: \(answer)"
        
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
