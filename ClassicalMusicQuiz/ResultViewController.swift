//
//  ResultViewController.swift
//  ClassicalMusicQuiz
//
//  Created by Aki Kimura on 2019/07/28.
//  Copyright © 2019 Yuki Kimura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctRankLabel: UILabel!
    
    @IBOutlet weak var correctRankImage: UIImageView!
    
    @IBOutlet weak var correctNumber: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var correctCount: Int = 0
        
        for questionData in
        QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        correctNumber.text = "\(String(correctCount)) 問正解!"
        
        if correctCount < 3 {
            correctRankImage.image = UIImage(named: "me")
            //correctRankLabel.font = UIFont.systemFont(ofSize: 20)
            correctRankLabel.text = "また次回！"
        } else if correctCount < 5 {
            correctRankImage.image = UIImage(named: "tsubomi")
            correctRankLabel.text = "Good"
        }
        
        if correctCount == 5 {
            correctRankImage.image = UIImage(named: "flower")
            correctRankLabel.text = "Very Good"
        }
        
        if correctCount == 6 {
            correctRankImage.image = UIImage(named: "flowers2")
            correctRankLabel.text = "Excellent"
            correctNumber.text = "全問正解!"
        }
        
    }
}
