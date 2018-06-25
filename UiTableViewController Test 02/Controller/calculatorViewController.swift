//
//  calculatorViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_06 on 2018. 6. 21..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {
	
    
    var isNumber = true
    var num = String()
    var num1 = String()
    var sum = Int()
    var ck = Int()
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "계산기"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zero(_ sender: Any) {
        if isNumber{
            num = num + "0"
            text1.text = num}
        else{
            num1 = num1 + "0"
            text1.text = num1}
    }
    @IBAction func one(_ sender: Any) {
        if isNumber{
            num = num + "1"
            text1.text = num}
        else{
            num1 = num1 + "1"
            text1.text = num1}
    }
    @IBAction func two(_ sender: Any) {
        if isNumber{
            num = num + "2"
            text1.text = num}
        else{
            num1 = num1 + "2"
            text1.text = num1}
    }
    @IBAction func three(_ sender: Any) {
        if isNumber{
            num = num + "3"
            text1.text = num}
        else{
            num1 = num1 + "3"
            text1.text = num1}
    }
    @IBAction func four(_ sender: Any) {
        if isNumber{
            num = num + "4"
            text1.text = num}
        else{
            num1 = num1 + "4"
            text1.text = num1}
    }
    @IBAction func five(_ sender: Any) {
        if isNumber{
            num = num + "5"
            text1.text = num}
        else{
            num1 = num1 + "5"
            text1.text = num1}
    }
    @IBAction func six(_ sender: Any) {
        if isNumber{
            num = num + "6"
            text1.text = num}
        else{
            num1 = num1 + "6"
            text1.text = num1}
    }
    @IBAction func seven(_ sender: Any) {
        if isNumber{
            num = num + "7"
            text1.text = num}
        else{
            num1 = num1 + "7"
            text1.text = num1}
    }
    @IBAction func eight(_ sender: Any) {
        if isNumber{
            num = num + "8"
            text1.text = num}
        else{
            num1 = num1 + "8"
            text1.text = num1}
    }
    @IBAction func nine(_ sender: Any) {
        if isNumber{
            num = num + "9"
            text1.text = num}
        else{
            num1 = num1 + "9"
            text1.text = num1}
    }

    @IBAction func plus(_ sender: Any) {
        if isNumber{
        isNumber = false
        ck = 1
            text1.text = ""}
        
    }
    
    @IBAction func minus(_ sender: Any) {
        if isNumber{
            isNumber = false
            ck = 2
            text1.text = ""}
    }
	@IBAction func multiply(_ sender: Any) {
		if isNumber{
			isNumber = false
			ck = 3
			text1.text = ""}
	}
	@IBAction func
		division(_ sender: Any) {
		if isNumber{
			isNumber = false
			ck = 4
			text1.text = ""}
	}
    @IBAction func calculator(_ sender: Any) {
		if(isNumber == false){
        switch ck {
        case 1:
            sum = Int(num)! + Int(num1)!
            break
        case 2:
            sum = Int(num)! - Int(num1)!
            break
        case 3:
            sum = Int(num)! * Int(num1)!
            break
        case 4:
            sum = Int(num)! / Int(num1)!
            break
        default:
            break
        }
            text1.text = ""
			text2.text = String(sum)
            num1 = ""
            num = ""
            isNumber = true
        }
	}
    @IBAction func clear(_ sender: Any) {
        text1.text = ""
        num1 = ""
        num = ""
        isNumber = true
    }
    

    
}
