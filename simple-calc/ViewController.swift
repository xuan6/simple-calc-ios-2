//
//  ViewController.swift
//  simple-calc
//
//  Created by Xuan Liu on 16/10/23.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit



class ViewController: UIViewController  {
    
    var resultList : [Double] = []
    // textCellIdentifier = "LabelCell"
    
    var elements : [String] = []
    var numbers : [Double] = []
    var op : String = ""
    var result : Double = 0
    var countDot = 0
    
    /*func dotEvaluate (elements:[String]) {
        for i in elements {
            if i == "."{
                countDot += 1
            }
        }
        if countDot > 1 {
            resultLabel.text = "ERROR"
        }
    }*/
    
    
    func numberRender(elements: [String])->Double{
        var dotIndex : Int = elements.count
        var numericalResult : Double = 0//enable decimal caculation, so set the number as optional decimal
        let totalIndex: Int = elements.count - 1 //accessible index
        let decimalExist = elements.contains(".")
        
        if decimalExist { //if decimal, store the index of dot
            dotIndex = elements.index(of:".")!
        }
        
        /*if countDot > 1 {
            resultLabel.text = "ERROR"
            return nil
        }else if countDot == 1{
            dotIndex = elements.index(of:".")!
        } else {
            dotIndex = elements.count
        }*/
        
        var power : Int
        if totalIndex != 0 {//mutiple digits
            var i = 0
            while i <= totalIndex {
                var exp : Double = 1
                if i < dotIndex { //if decimal, calculate the value before dot; otherwise means to calculate the total value of the number
                    power = dotIndex - i - 1
                    var e = 1
                    while e <= power {
                        exp = exp * 10
                        e += 1
                    }
                }else if i > dotIndex { //if decimal, calculate the value after dot - the decimal part; otherwise skip this step
                    power = dotIndex - i
                    print(elements[i])
                    var d = -1
                    while d >= power {
                        exp = exp / 10
                        d -= 1
                    }
                    
                } else {
                    i += 1
                    continue
                    //if this element is the dot, keep loop
                }
            
            let temp : String = elements[i]
            let intDigit : Int = Int(temp)!
            
            numericalResult += Double(intDigit) * Double(exp) //use exponential
            i += 1
        }
        }else{// only one number
            
            numericalResult = Double(elements[0])!
            
        }
        
        return numericalResult
    }
    
    
    //MARK: Properties
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: Actions

   
    @IBAction func oneBtn(_ sender: AnyObject) {
        elements.append("1")
    }
    
    @IBAction func twoBtn(_ sender: AnyObject) {
        elements.append("2")
    }
    
    @IBAction func threeBtn(_ sender: AnyObject) {
        elements.append("3")
    }
    @IBAction func fourBtn(_ sender: AnyObject) {
        elements.append("4")
    }
    @IBAction func fiveBtn(_ sender: AnyObject) {
        elements.append("5")
    }
    @IBAction func sixBtn(_ sender: AnyObject) {
        elements.append("6")
    }
    @IBAction func sevenBtn(_ sender: AnyObject) {
        elements.append("7")
    }
    @IBAction func eightBtn(_ sender: AnyObject) {
        elements.append("8")
    }
    @IBAction func nineBtn(_ sender: AnyObject) {
        elements.append("9")
    }
    @IBAction func zeroBtn(_ sender: AnyObject) {
        elements.append("0")
    }
    @IBAction func dotBtn(_ sender: AnyObject) {
        elements.append(".")
        var countD = 0
        for i in elements {
            if i == "."{
                countD += 1
            }
        }
        if countD > 1{
            resultLabel.text = "ERROR"
            elements = []
        }
        if countD == 1 && elements[0]=="."{
            resultLabel.text = "ERROR"
            elements = []
        }
    }
    @IBAction func addBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "+"
        numbers.append(num)
        elements = []
    }
    @IBAction func subBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "-"
        numbers.append(num)
        elements = []
    }
    @IBAction func mulBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "*"
        numbers.append(num)
        elements = []
    }
    @IBAction func divBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "/"
        numbers.append(num)
        elements = []
    }
    @IBAction func modBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "%"
        numbers.append(num)
        elements = []
    }
    @IBAction func factBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "fact"
        numbers.append(num)
        elements = []
    }
    @IBAction func avgBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "avg"
        numbers.append(num)
        elements = []
    }
    
    @IBAction func countBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        op = "count"
        numbers.append(num)
        elements = []
    }
    //only take two numbers
    /*@IBAction func resultBtn(_ sender: AnyObject) {
        let num :Double = numberRender(elements: elements)
        numbers.append(num)
        let num1 = numbers[0]
        let num2 = numbers[1]
        switch op{
        case "+":
            result = num1 + num2
        case "-":
            result = num1 - num2
        case "*":
            result = num1 * num2
        case "/":
            result = num1 / num2
        case "%":
            result = num1.truncatingRemainder(dividingBy: num2)
        case "fact":
            var tempResult : Double = 1
            var num = numbers[0]
            while num >= 1 {
                tempResult = tempResult * num
                num -= 1
            }
            result = tempResult
        case "avg":
            let total : Double = numbers.reduce(0,+)
            let count : Double = Double(numbers.count)
            result = total/count
        case "count":
            result = Double(numbers.count)
        default:
            result = 0
        }

        resultLabel.text = String(result)
        numbers = []
        result = 0
        elements = []
        
    }*/
    //take array of numbers
    
    @IBAction func resultBtn(_ sender: AnyObject) {
        let num :Double? = numberRender(elements: elements)
        if num != nil {
            numbers.append(num!)

        switch op{
        case "+":
            result = numbers.reduce(0,+)
        case "-":
            result = 2*numbers[0]-numbers.reduce(0,+)
        case "*":
            result = numbers.reduce(1,*)
        case "/":
            result = numbers[0]*numbers[0]/numbers.reduce(1,*)
        case "%":
            let num1 = numbers[0]
            let num2 = numbers[1]
            result = num1.truncatingRemainder(dividingBy: num2)
        case "fact":
            var tempResult : Double = 1
            var num = numbers[0]
            while num >= 1 {
                tempResult = tempResult * num
                num -= 1
            }
            result = tempResult
        case "avg":
            let total : Double = numbers.reduce(0,+)
            let count : Double = Double(numbers.count)
            result = total/count
        case "count":
            result = Double(numbers.count)
        default:
            result = 0
        }
            resultLabel.text = String(result)
        }else{
            resultLabel.text = "ERROR"
        }
        
        resultList.insert(result, at: 0)
        
        numbers = []
        result = 0
        elements = []
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    


}

