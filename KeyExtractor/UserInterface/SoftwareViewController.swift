//
//  SoftwareViewController.swift
//  KeyExtractor
//
//  Created by remy on 05/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

///Represents the controller for the Software List View
class SoftwareViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    // MARK: Attributes
    
    ///The TableView
    @IBOutlet private var tableView: NSTableView!
    
    ///The software list
    private var softwareList: [Software] = []
    
    // MARK: Initializers
    
    /**
    Initializes the software manager.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize the software manager
        let softwareManager: SoftwareManager = SoftwareManager()
        
        //launch the research of software
        softwareManager.fileSeek()
        
        //The software list is initialised with software detected on the computor
        softwareList = softwareManager.getSoftwares()

    }
    
    // MARK: Functions
    
    /**
    Returns the number of rows in the table view (equal to the number of software)
    
    :return: softwareList.count
    */
    func numberOfRowsInTableView(tableView: NSTableView) -> Int{
    
        /* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView).
        */
        return softwareList.count
    }
    /**
    Initializes the table view of software
    */
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {

        if row < softwareList.count {	// prevents a rare crash when the last app in the table quits
            
            if let identifier = tableColumn?.identifier{
                switch identifier{
                    
                case "Name":
                    let cell = tableView.makeViewWithIdentifier("SoftwareCellName", owner: self) as! SoftwareCell
                    cell.loadItem(softwareList[row].getName())
                    return cell
                    
                case "Copyright":
                    let cell = tableView.makeViewWithIdentifier("SoftwareCellCopyright", owner: self) as! SoftwareCell
                    cell.loadItem(softwareList[row].getCopyright())
                    return cell
                    
                case "Version":
                    let cell = tableView.makeViewWithIdentifier("SoftwareCellVersion", owner: self) as! SoftwareCell
                   cell.loadItem(softwareList[row].getVersion())
                    return cell
                    
                case "Key":
                    let cell = tableView.makeViewWithIdentifier("SoftwareCellKey", owner: self) as! SoftwareCell
                    cell.loadItem(softwareList[row].getKey())
                    return cell
                    
                case "Sell":
                    let cell = tableView.makeViewWithIdentifier("check", owner: self) as! SoftwareButton
                    cell.loadItem(softwareList[row])
                    return cell
                    
                default:
                    NSException(name: "Error Tab identifier", reason: "TabColumn identifier desn't exist", userInfo: nil)
                    return nil

                }
            }
        }
        NSException(name: "Error row > software number", reason: "row great than the software number", userInfo: nil)
        return nil
    }
    ///Add a software to the sell list
    @IBAction func addSoftwareSell(sender: AnyObject) {
        
        var softwareListSell: [Software] = []
        
        for software in self.softwareList{
            if software.getSell() == 1{
                softwareListSell.append(software)
            }
        }
        
        println("taille de ma liste")
        println(softwareListSell.count)
        
    }

}

extension SoftwareViewController{
    
    ///Switch the software state between to-sell or not-to-sell
    @IBAction func ModifyStateSoftware(sender: SoftwareButton) {
        if sender.getState() == NSOnState{
            let soft :Software = sender.getRepresentatedObject()!
            soft.setSell(1)
        }
        else{
            let soft :Software = sender.getRepresentatedObject()!
            soft.setSell(0)
        }
        
    }
}
