//
//  QuestionViewController.swift
//  ClassicalMusicQuiz
//
//  Created by Aki Kimura on 2019/07/28.
//  Copyright © 2019 Yuki Kimura. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    var questionData: QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answer1Button: UIButton!
    
    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionNoLabel.text = "問\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1,
                               for: UIControl.State.normal)
        answer2Button.setTitle(questionData.answer2,
                               for: UIControl.State.normal)
        answer3Button.setTitle(questionData.answer3,
                               for: UIControl.State.normal)
        answer4Button.setTitle(questionData.answer4,
                               for: UIControl.State.normal)
    }
    
    @IBAction func tapAnswer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    
    
    @IBAction func tapAnswer2Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    

    @IBAction func tapAnswer3Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    
    
    @IBAction func tapAnswer4Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    func goNextQuestionWithAnimation() {
        if questionData.isCorrect() {
            goNextQuestionWithCorrectAnimation()
        } else {
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    func goNextQuestionWithCorrectAnimation() {
        AudioServicesPlayAlertSound(1022)
        UIView.animate(withDuration: 2.0, animations: {
         //   self.correctImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion(answer: "正解")
        }
    }
    
    func goNextQuestionWithIncorrectAnimation() {
        UIView.animate(withDuration: 2.0, animations: {
          //  self.incorrectImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion(answer: "残念...")
        }
    }
    
    func goNextQuestion(answer: Any) {
        // 解説画面へ遷移
        let parameters = [answer, questionData.questionNo, questionData.correctAnswer, questionData.description]
        self.performSegue(withIdentifier: "answer", sender: parameters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answer" {
            let answerViewController = segue.destination as! AnswerViewController
            answerViewController.parameters = (sender as! [Any])
        }
    }
}
