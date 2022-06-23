//
//  Question.swift
//  quizzler
//
//  Created by Kittisak Panluea on 22/6/2565 BE.
//

import Foundation

struct Question {
    let text:String
    let answer:[String]
    let correctAnswer:String
    
    init(question:String , answer:[String] , correctAnswer:String){
        text = question
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
}
