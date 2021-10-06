//
//  ViewController.swift
//  CalculatorAssignmentOne
//
//  Created by user202286 on 9/21/21.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var lblCalc: UILabel!
    var object = Calculator.init()
    var checkString = [String]()
    @IBOutlet weak var lblAdvance: UILabel!
    
    @IBOutlet weak var btnOutletClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblAdvance.isHidden = true
        btnOutletClear.isHidden = true

    }
    

    @IBAction func calculatorButtons(_ sender: UIButton) {
        lblCalc.text?.append("\(sender.currentTitle!) ")
        checkString = object.push(s: sender.currentTitle!)
        if !object.validate().isEmpty  {
            let alertController = UIAlertController(title: "Alert", message: object.validate(), preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { [self]
                (action: UIAlertAction!) in
                // Code in this block will trigger when OK button tapped.
                lblCalc.text! = " "
                checkString = [String]()
                object = Calculator.init()
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
             
            
    }
    @IBAction func btnEqual(_ sender: Any) {
        lblCalc.text?.append("=\(object.calc()) ")
        if lblAdvance.isHidden == false {
            if lblCalc.text != nil{
                lblAdvance.text! += lblCalc.text! + "\n"
            }
        }
         
    }
    @IBAction func btnClear(_ sender: Any) {
        lblCalc.text = " "
        object = Calculator.init()
    }
    
    @IBAction func btnAdvance(_ sender: Any) {
        if lblAdvance.isHidden == true{
            lblAdvance.isHidden = false
            btnOutletClear.isHidden = false
        }else{
            lblAdvance.isHidden = true
            btnOutletClear.isHidden = true
        }
        
    }
    
    @IBAction func btnAdvanceClear(_ sender: Any) {
        lblAdvance.text = " "
    }
}

