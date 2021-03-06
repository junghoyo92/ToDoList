//
//  SecondViewController.swift
//  To Do List
//
//  Created by Hoyoung Jung on 1/19/16.
//  Copyright © 2016 Hoyoung Jung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // Initializes the userInput text field
    @IBOutlet var userInput: UITextField!
    
    // Initializes the addItem button
    @IBAction func addItem(sender: AnyObject) {
        
        // Adds the userInput to the Global array for the to-do list when the button is pressed
        listArray.append(userInput.text!)
        
        // Resets the userInput text field to nothing so one can enter multiple tasks
        userInput.text = ""
        
        // Update NSUserDefaults for the permanent storage
        NSUserDefaults.standardUserDefaults().setObject(listArray, forKey: "listArray")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Setting the userInput so that the textfield is delegated to the return functions
        self.userInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Closes the keyboard by pressing anywhere
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Closes the keyboard by pressing return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }

}

