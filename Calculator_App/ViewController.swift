//
//  ViewController.swift
//  Calculator_App
//
//  Created by Reena Sarkar on 1/22/17.
//  Copyright © 2017 Reena Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    
    var total:Double = 0;
    
    var operation:Int = 0;
    
    var performingMath = false;
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sign: UILabel!
    
    @IBOutlet weak var labelB: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true {
            if sender.tag == 17{
                label.text = label.text! + "."
            } else{
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
                performingMath = true
            }

            
        } else {
            if sender.tag == 17{
                label.text = label.text! + "."
            } else {
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
            }

        }

    }
    
    func performOp(_ operation:Int, _ firstNum:Double, _ secondNum:Double) -> Double{
        if operation == 12 { //add
            result.text = ""
            return (firstNum + secondNum);
        } else if operation == 13 { //subtract
            result.text = ""
            return (firstNum - secondNum);
        } else if operation == 14 { //multiply
            result.text = ""
            return (firstNum * secondNum);
        } else { //divide
            result.text = ""
            return (firstNum / secondNum);
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            //previousNumber = Double(label.text!)!
            
            if sender.tag == 12 { //add
                if labelB.text != "" {
                    sign.text = "+";
                    total = performOp(operation, previousNumber, numberOnScreen);
                    previousNumber = total;
                    numberOnScreen = 0;
                    labelB.text = String(total);
                    label.text = "";
                } else {
                    sign.text = "+"
                    labelB.text = label.text
                    label.text = ""
                    previousNumber = numberOnScreen
                    numberOnScreen = 0
                }
                
            }
            else if sender.tag == 13 { //subtract
                if labelB.text != "" {
                    sign.text = "-";
                    total = performOp(operation, previousNumber, numberOnScreen);
                    previousNumber = total;
                    numberOnScreen = 0;
                    labelB.text = String(total);
                    label.text = "";
                } else {
                    sign.text = "-"
                    labelB.text = label.text
                    label.text = ""
                    previousNumber = numberOnScreen
                    numberOnScreen = 0
                }
            }
                
            else if sender.tag == 14 { //multiply
                if labelB.text != "" {
                    sign.text = "x";
                    total = performOp(operation, previousNumber, numberOnScreen);
                    previousNumber = total;
                    numberOnScreen = 0;
                    labelB.text = String(total);
                    label.text = "";
                } else {
                    sign.text = "x"
                    labelB.text = label.text
                    label.text = ""
                    previousNumber = numberOnScreen
                    numberOnScreen = 0
                }
                
            }
            else if sender.tag == 15 { //divide
                if labelB.text != "" {
                    sign.text = "/";
                    total = performOp(operation, previousNumber, numberOnScreen);
                    previousNumber = total;
                    numberOnScreen = 0;
                    labelB.text = String(total);
                    label.text = "";
                } else {
                    sign.text = "/"
                    labelB.text = label.text
                    label.text = ""
                    previousNumber = numberOnScreen
                    numberOnScreen = 0
                }
                
            }
            
            operation = sender.tag;
            performingMath = true;
            
        }
        
        else if sender.tag == 16 {
            total = performOp(operation, previousNumber, numberOnScreen);
            result.text = String(total)
        }
        
        else if sender.tag == 11 {
            total = 0;
            operation = 0;
            previousNumber = 0;
            numberOnScreen = 0;
            label.text = ""
            labelB.text = ""
            sign.text = ""
            result.text = ""
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

