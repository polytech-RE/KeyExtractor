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
    
    private var softwareList: [Software] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let softwareManager: SoftwareManager = SoftwareManager()
        softwareManager.fileSeek()
        softwareList = softwareManager.getSoftwares()

    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int{
    
        /* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView).
        */
        return softwareList.count
    }

    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject?{
    
        /* NOTE: This method is not called for the View Based TableView.
        */
        return nil
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if row < softwareList.count {	// prevents a rare crash when the last app in the table quits

            if let identifier = tableColumn?.identifier {
                
                if tableColumn == "Name"{
                    let cell = tableView.makeViewWithIdentifier("SoftwareCellName", owner: self) as! SoftwareCell
                
                    cell.label.stringValue = softwareList[row].getName()
                    return cell
                }
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
