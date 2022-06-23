//
//  Question.swift
//  quizzler
//
//  Created by Kittisak Panluea on 22/6/2565 BE.
//

import Foundation

struct Question {
    let text:String
    let answer:String
    
    init(question:String , answer:String){
        text = question
        self.answer = answer
    }
}
