//
//  AnswerViewController.swift
//  ClassicalMusicQuiz
//

import UIKit

class AnswerViewController: UIViewController {
    
    var parameters: [Any]!
    
    @IBOutlet weak var correctTextView: UILabel!
    
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBOutlet weak var correctImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctTextView.text = (parameters[0] as! String)
        answerTextView.text = (parameters[2] as! String)
        correctImageView.image = UIImage(named: parameters[3] as! String)
    }
    
    @IBAction func tapNextQuestion(_ sender: Any) {
        
        let dictKey = parameters[1] as! Int
        if dictKey > 5 {
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
        
        if let nextQuestionViewContoroller = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextQuestionViewContoroller.questionData = QuestionDataManager.sharedInstance.nextQuestion()
            present(nextQuestionViewContoroller, animated: true, completion: nil)
        }
    }
}
