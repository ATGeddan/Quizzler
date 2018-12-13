//
//  ViewController.swift
//  Quizzler2
//
//  Created by Admin on 8/8/1439 AH.
//  Copyright © 1439 AH Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressNumber: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let allQuestions = QuestionBank()
    var chosenAnswer:Bool!
    var questionNumber:Int = -1
    var score:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }

    func nextQuestion() {
        UpdateUI()
        questionNumber += 1
        if questionNumber < 13 {
        questionLabel.text = allQuestions.list[questionNumber].question
        } else {
            questionNumber = 0
            let alert = UIAlertController(title: "Your final score is \(score)", message: "Do you want to start over?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { [weak self]_ in
                self?.startOver() }))
            present(alert, animated: true, completion: nil)
        }
    }
    func UpdateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        progressNumber.text = "\(questionNumber + 1) / 13"
        scoreLabel.text = "Score : \(score)"
    }
    func startOver() {
        questionNumber = -1
        score = 0
        nextQuestion()
        
    }
    func checkAnswer() {
        let currentQuestion = allQuestions.list[questionNumber]
        if currentQuestion.correctAnswer == chosenAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
         
        } else if currentQuestion.correctAnswer != chosenAnswer {
            ProgressHUD.showError("Wrong")
       
        }
        
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            chosenAnswer = true
        } else if sender.tag == 2 {
            chosenAnswer = false
        }
        checkAnswer()
    }
    
    

    


}

