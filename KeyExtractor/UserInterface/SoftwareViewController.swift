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
    
    override func viewDidAppear() {
        super.viewDidAppear()
        if ((self.tableView) != nil){
            self.tableView.reloadData()
        }
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
    /*
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSCell? {

        if row < softwareList.count {	// prevents a rare crash when the last app in the table quits
            if let identifier = tableColumn?.identifier{
                
                switch identifier{
                case "Name":
                    let cell = tableView.makeViewWithIdentifier("CellName", owner: self) as! NSTextFieldCell
                    cell.stringValue = softwareList[row].getName()
                    return cell
                case "Copyright":
                    let cell = tableView.makeViewWithIdentifier("", owner: self) as! SoftwareCell
                    println("Mon copyright :")
                    println(softwareList[row].getCopyright())
                    cell.softwareName.stringValue = softwareList[row].getCopyright()
                    return cell
                case "Version":
                    let cell = tableView.makeViewWithIdentifier("SoftwareCell", owner: self) as! SoftwareCell
                    cell.softwareName.stringValue = softwareList[row].getVersion()
                    return cell
                case "Key":
                    println("AKEIGRVUAEGYF : \(softwareList[row].getKey())")
                    let cell = tableView.makeViewWithIdentifier("SoftwareCell", owner: self) as! SoftwareCell
                    cell.softwareName.stringValue = softwareList[row].getKey()
                    //cell.textField?.lineBreakMode = NSLineBreakMode(rawValue: 2)!
                    //cell.textField?.sizeToFit()
                    
                    println("AKEIGRVUAEGYF : \(cell.softwareName.stringValue)")
                    return cell
                default:
                    return nil
                    //TODO Exception
                }
            }
        }
        return nil
        //TODO Exception
    }
    
    
    func tableView(tableView: NSTableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> NSTableCellView!{
        
        var cell:NSTableCellView = self.tableView.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView!
        
        cell.textField!.stringValue = "test"
        
        return cell
    }
*/
    func tableView(tableView: NSTableView, dataCellForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSCell?{
        let cell: NSCell = NSTextFieldCell(textCell: "text")
        return cell
    }
    
    
}
