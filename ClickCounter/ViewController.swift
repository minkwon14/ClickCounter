//
//  ViewController.swift
//  ClickCounter
//
//  Created by Minseo Kwon on 2017-11-15.
//  Copyright © 2017 MinKwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Declaring variables including Outlets.
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var numCount: UILabel!
    
    @IBOutlet weak var recordHolder: UIView!
    @IBOutlet weak var savedRecord: UITextField!
    @IBOutlet weak var clearRecord: UIButton!
    @IBOutlet weak var returnMenu: UIButton!
    @IBOutlet weak var recordField: UITextView!
    
    // Set initial values of counter.
    var clickCounter = 0
    var currentTD : String = ""
    var counterRecord = ""
    
    //
    // Functions
    //

    // Function to add counter.
    @IBAction func addCounter(_ sender: Any) {
        clickCounter += 1
        numCount.text = "\(clickCounter)"
    }
    
    // Function to subtract counter.
    @IBAction func subCounter(_ sender: Any) {
        
        // Add condition not to have negative count.
        if (clickCounter > 0) {
            clickCounter -= 1
        } else {
            clickCounter = 0
        }
        numCount.text = "\(clickCounter)"
    }
    
    // Function to reset counter.
    @IBAction func resetCounter(_ sender: Any) {
        clickCounter = 0
        numCount.text = "\(clickCounter)"
    }
    
    // Function to save current counter.
    @IBAction func saveCounter(_ sender: Any) {
        currentTD = getCurrentTD()
        counterRecord = recordField.text
        counterRecord += "Time: " + currentTD + " Count: " + "\(clickCounter)" + "\n"
        recordField.text = counterRecord
        UserDefaults.standard.set(recordField.text, forKey: "myRecord")
    }
    
    // Function to view current record.
    @IBAction func viewCounter(_ sender: Any) {
        recordHolder.isHidden = false
        addBtn.isHidden = true
        subBtn.isHidden = true
        saveBtn.isHidden = true
        viewBtn.isHidden = true
        numCount.isHidden = true
    }
   
    // Function to clear current record.
    @IBAction func clearRecord(_ sender: Any) {
        counterRecord = ""
        recordField.text = counterRecord
        UserDefaults.standard.set(recordField.text, forKey: "myRecord")
    }
 
    // Function to return to main menu.
    @IBAction func returnMenu(_ sender: Any) {
        recordHolder.isHidden = true
        addBtn.isHidden = false
        subBtn.isHidden = false
        saveBtn.isHidden = false
        viewBtn.isHidden = false
        numCount.isHidden = false
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recordField.isUserInteractionEnabled = false
    }
    
    // Check if UserDefaults exist.
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myRecord") as? String {
            recordField.text = x
        }
    }
    
    // Function to get current time and date.
    func getCurrentTD () -> String {
        // Declaring time and date format
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        
        // get the date time String from the date object
        currentTD = formatter.string(from: currentDateTime)
        
        return currentTD
    }

}

