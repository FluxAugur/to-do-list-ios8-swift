//
//  FirstViewController.swift
//  To Do List
//
//  Created by Nathanial L. McConnell on 9/19/14.
//  Copyright (c) 2014 Nathanial L. McConnell. All rights reserved.
//

import UIKit

var toDoItems: [String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet var tasksTable: UITableView?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(animated: Bool) {
    if var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("todo") {
      toDoItems = []
      for var i = 0; i < storedToDoItems.count; ++i {
        toDoItems.append(storedToDoItems[i] as NSString)
      }
    }
    tasksTable?.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    
    cell?.textLabel?.text = toDoItems[indexPath.row]
    
    return cell!
  }

  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      toDoItems.removeAtIndex(indexPath.row)
      NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "todo")
      NSUserDefaults.standardUserDefaults().synchronize()

      tasksTable?.reloadData()
    }
  }
}

