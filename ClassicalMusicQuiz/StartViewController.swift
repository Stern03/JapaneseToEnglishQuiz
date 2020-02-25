//
//  StartViewController.swift
//  ClassicalMusicQuiz
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as?
            QuestionViewController else {
            // 取得できずに終了
            return
        }
        
        // 問題文の切り出し
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            
            // 取得できずに終了
            return
        }
        
        // 問題文のセット
        nextViewController.questionData = questionData
    }
    
    // タイトルに戻ってくるときに呼び出される処理
    @IBAction func goToTititle(_ segue: UIStoryboardSegue) {
        
    }

}
