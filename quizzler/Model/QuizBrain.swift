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
        Question(question: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(question: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
               Question(question: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(question: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(question: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(question: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(question: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(question: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(question: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(question: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool{
        if userAnswer == quiz[questionNumber].correctAnswer {
            //  User got it right
            score += 1
            return true
        } else {
            //  User got it wrong
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getAnswerText() -> [String] {
        return quiz[questionNumber].answer
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
            score = 0
            questionNumber = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
}
