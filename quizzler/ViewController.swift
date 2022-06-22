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
    
//    คำถามที่มีในแอปเปอพึด
    let quiz = [
        ["Four + Two is equal to Six." ,"True"],
        ["Fix - Three is greater than One" , "True"],
        ["Three + Eight is less than Ten" , "False"]
    ]
//    เอามาเช็คว่าคำถามไหนอ่านไปแล้วบ้าง
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        questionLB.text = quiz[questionNumber]
        updateUI()
    }

    @IBAction func anwserButtonPressed(_ sender: UIButton) {
//        ทีนี้ก็พอเค้ากดตุ่ม ทรูหรือฟอลมาก็ให้คำถามมันเพิ่มตำแหน่งไป
        questionNumber += 1  // แต่จะมีปัญหาเรื่องอาเรย์เกินขนาด
//        ปัญหาต่อมาคือมันจะไม่อัปเดต UI ใหม่ให้ต่อให้เรากดตุ่มไปแล้วก็ตาม วิธีคือทำการย้ายโค้ดบรรทัด 32 แยกออกมาเป็น func บรรทัดที่ 43 และเรียกใช้ใน
//        บรรทัดที่ 40
        updateUI()
    }
    
    func updateUI(){
        questionLB.text = quiz[questionNumber][0]
    }
    
}

