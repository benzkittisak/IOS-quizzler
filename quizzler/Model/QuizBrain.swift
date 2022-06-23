//
//  QuizBrain.swift
//  quizzler
//
//  Created by Kittisak Panluea on 23/6/2565 BE.
//
//  ไม่ว่าอะไรจะเกิดขึ้นกับคำถามตัว QuizBrain จะเป็นคนจัดการ

import Foundation

struct QuizBrain {
    /**
     เราใช้ let กับตัวแปรที่มันไม่ต้องเปลี่ยนแปลงค่าในภายหลังแหละ
     ส่วนตัว var คือตัวแปรที่มันสามารถเปลี่ยนแปลงค่าได้ในภายหลัง ก็คือ const กับ var ใน js นั่นแหละนะ
     */
    let quiz = [
        Question(question: "A slug's blood is green.", answer: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(question: "Google was originally called 'Backrub'.", answer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer:String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            //  User got it right
            return true
        } else {
            //  User got it wrong
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    //    mutating จะต้องใส่ไว้หน้า function ด้วย ถ้าเกิดว่า func นั้นทำให้เกิดการเปลี่ยนแปลงของตัวแปรใน struct
    //    เราจะเห็นว่า fn ตัวนี้มันไปแก้ค่าใน questionNumber เลยต้องใช้ mutating ไว้หน้า fn
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1  {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
}
