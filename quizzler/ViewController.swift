//
//  ViewController.swift
//  quizzler
//
//  Created by Kittisak Panluea on 22/6/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLB: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    //    คำถามที่มีในแอปเปอพึด ย้ายเจ้านี่ไปเป็น structure แหละอยู่ในไฟล์ Question
//    let quiz = [
//        ["Four + Two is equal to Six." ,"True"],
//        ["Fix - Three is greater than One" , "True"],
//        ["Three + Eight is less than Ten" , "False"]
//    ]
    
//    จะได้โค้ดข้างบนใหม่แบบนี้ จะได้เป็น Array ของ Object Question แทนที่จะเป็น Array 2D
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
    

    //    เอามาเช็คว่าคำถามไหนอ่านไปแล้วบ้าง
    var questionNumber = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        questionLB.text = quiz[questionNumber]
        updateUI()
    }
    
    @IBAction func anwserButtonPressed(_ sender: UIButton) {
        //        ทำส่วนของการตรวจสอบคำตอบด้วยการรับมาก่อนว่า user กดปุ่มอะไรมา
        guard let userAnswer = sender.currentTitle else { return print("Error the answer is nil") }
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //        แก้ปัญหาเรื่องของจำนวนข้อมันเกินขนาดของ Array
        //        คือต้อง - 1 เพราะว่าไม่งั้นมันจะทำให้ Array เกินขนาดอีกเพราะว่าสมมติมันเป็นเลข 2 แล้วมันเข้ามาทำงานแล้วบวกเป็น 3 มันก้พังอีกเช่นเคย
        if questionNumber < quiz.count - 1  {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        //        ทีนี้ก็พอเค้ากดตุ่ม ทรูหรือฟอลมาก็ให้คำถามมันเพิ่มตำแหน่งไป
        //        questionNumber += 1  // แต่จะมีปัญหาเรื่องอาเรย์เกินขนาด
        //        ปัญหาต่อมาคือมันจะไม่อัปเดต UI ใหม่ให้ต่อให้เรากดตุ่มไปแล้วก็ตาม วิธีคือทำการย้ายโค้ดบรรทัด 32 แยกออกมาเป็น func บรรทัดที่ 43 และเรียกใช้ใน
        //        บรรทัดที่ 40
        
//        ทำให้มันหน่วงเวลาเคลียร์ค่าสีของปุ่ม เพราะว่าถ้าไม่หน่วงเราจะไม่เห็นสีของปุ่มที่เปลี่ยนไปเวลากดตุ่ม
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLB.text = quiz[questionNumber].text
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
}

