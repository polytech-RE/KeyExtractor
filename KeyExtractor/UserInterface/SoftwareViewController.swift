//
//  SoftwareViewController.swift
//  KeyExtractor
//
//  Created by remy on 05/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

class SoftwareViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet
    var tableView: NSTableView!
    
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int{
    
        /* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView).
        */
        return items.count
    }

    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject?{
    
        /* NOTE: This method is not called for the View Based TableView.
        */
        return nil
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if row < items.count {	// prevents a rare crash when the last app in the table quits

            if let identifier = tableColumn?.identifier {
                
                let cell = tableView.makeViewWithIdentifier("SoftwareCell", owner: self) as! SoftwareCell
                
                cell.softwareName.stringValue = items[row]
                return cell
            }
        }
        return nil
    }
    
    
    func tableView(tableView: NSTableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> NSTableCellView!{
        
        var cell:NSTableCellView = self.tableView.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView!
        
        cell.textField!.stringValue = "test"
        
        return cell
    }

    
}
