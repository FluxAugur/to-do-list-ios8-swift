//
//  SecondViewController.swift
//  To Do List
//
//  Created by Nathanial L. McConnell on 9/19/14.
//  Copyright (c) 2014 Nathanial L. McConnell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var toDoItem: UITextField!
  
  @IBAction func addItem(sender: AnyObject) {
    toDoItems.append(toDoItem.text)
    NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "todo")
    NSUserDefaults.standardUserDefaults().synchronize()
    self.view.endEditing(true)
    println(toDoItems)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    self.view.endEditing(true)
  }
}

