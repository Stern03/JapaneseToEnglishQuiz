//
//  QuestionData.swift
//  ClassicalMusicQuiz
//
//  Created by Aki Kimura on 2019/07/28.
//  Copyright © 2019 Yuki Kimura. All rights reserved.
//
import Foundation

class QuestionData {

var question: String

var answer1: String

var answer2: String

var answer3: String

var answer4: String

var correctAnswerNumber: Int

var userChoiceAnswerNumber: Int?

var questionNo: Int = 0

var correctAnswer: String
    
var description: String

init(questionSourceDataArray: [String]) {
    question = questionSourceDataArray[0]
    answer1 = questionSourceDataArray[1]
    answer2 = questionSourceDataArray[2]
    answer3 = questionSourceDataArray[3]
    answer4 = questionSourceDataArray[4]
    correctAnswerNumber = Int(questionSourceDataArray[5])!
    correctAnswer = questionSourceDataArray[6]
    description = questionSourceDataArray[7]
}

    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNumber {
            return true
        }
        
        return false
    }
}

class QuestionDataManager {
    
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    
    var nowQuestionIndex: Int = 0
    
    private init() {
        
    }
    
    func loadQuestion() {
        
        questionDataArray.removeAll()
        
        nowQuestionIndex = 0
        
        guard let csvFilePath = Bundle.main.path(forResource: "quiz", ofType: "csv") else {
            print("csvファイルが存在しません")
            return
        }
        
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath,
                                           encoding: String.Encoding.utf8)
            // 配列にする
            let csvLines = csvStringData.components(separatedBy: .newlines)
            let resultArray = csvLines.shuffled().filter{!$0.isEmpty}
            for i in 0...resultArray.count - 1 {
                let questionSourceDataArray = resultArray[i].components(separatedBy: ",")
                let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                self.questionDataArray.append(questionData)
                questionData.questionNo = self.questionDataArray.count
            }
           
        } catch let error {
            print("csvファイル読み込みエラーが発生しました：\(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
