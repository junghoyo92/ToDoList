//
//  FirstViewController.swift
//  To Do List
//
//  Created by Hoyoung Jung on 1/19/16.
//  Copyright © 2016 Hoyoung Jung. All rights reserved.
//

import UIKit

// Defining a Global Variable listArray of strings
// () initializes empty array
var listArray = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var toDoList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Syncing listArray with NSUserDefaults for permanent data storage if the NSUserDefaults exists
        if NSUserDefaults.standardUserDefaults().objectForKey("listArray") != nil {
            
            listArray = NSUserDefaults.standardUserDefaults().objectForKey("listArray") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listArray.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            listArray.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(listArray, forKey: "listArray")
            
            toDoList.reloadData()

        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoList.reloadData()
    }
    
}