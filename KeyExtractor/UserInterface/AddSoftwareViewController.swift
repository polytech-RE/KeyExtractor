//
//  ViewController.swift
//  KeyExtractor
//
//  Created by remy on 22/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

class AddSoftwareViewController: NSViewController {

    
    // MARK: Attributes
    
    //The software attributes to display in textfields
    @IBOutlet weak private var name: NSTextField!
    @IBOutlet weak private var licencePath: NSTextField!
    @IBOutlet weak var softwareKey: NSTextField!
    @IBOutlet weak private var format: NSPopUpButton!
    @IBOutlet weak private var infoPath: NSTextField!

    
    //Labels to print message error
    @IBOutlet weak var nameError: NSTextField!
    @IBOutlet weak var licencePathError: NSTextField!
    @IBOutlet weak var keyError: NSTextField!
    @IBOutlet weak var informationPathError: NSTextField!

    // MARK: Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        }

    // MARK: Functions
    
    /**Write information about a software in ways.txt in order to be able to search and find its licence key
    */
    @IBAction func addSoftwareToSearch(sender: AnyObject) {
        
        //clean value
        nameError!.stringValue = ""
        licencePathError!.stringValue  = ""
        informationPathError!.stringValue = ""
        keyError!.stringValue = ""
        
        //check the fields
        if(name.stringValue == ""){
            nameError!.stringValue = "fill the field: name"
        }
        if(licencePath.stringValue == ""){
            licencePathError!.stringValue = "fill the field: licence path"
        }
        if(infoPath.stringValue == ""){
            informationPathError!.stringValue = "fill this field"
        }
        if(softwareKey.stringValue == ""){
            keyError!.stringValue = "fill the field: key"
        }

        
        let formatValue: String
        
        switch format.titleOfSelectedItem!{
            
            case "dictionary":
                formatValue = "Plist"
            case "xml attribute":
                formatValue = "xml"
            case "text":
                formatValue = "txt"
            default:
                formatValue = String()
        }

        // record information
        if( name.stringValue != "" && licencePath.stringValue != "" && softwareKey.stringValue != "" && infoPath.stringValue != ""){
            
            let line: String
            line = name.stringValue + ";" + licencePath.stringValue + ";" + formatValue + ";" +  softwareKey.stringValue + ";" + infoPath.stringValue + "\n"
            let encodingLine = line.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
    
            let dir:String = NSFileManager.defaultManager().currentDirectoryPath

            let fileurl = dir + "/ways.txt"
            println(fileurl)
            println(NSBundle.mainBundle().bundlePath)
            
            if NSFileManager.defaultManager().fileExistsAtPath(fileurl) {
                var err:NSError?
                if let fileHandle = NSFileHandle(forWritingAtPath: fileurl) {
                    
                    fileHandle.seekToEndOfFile()
                    fileHandle.writeData(encodingLine)
                    fileHandle.closeFile()
                    
                    name.stringValue = ""
                    licencePath.stringValue = ""
                    softwareKey.stringValue = ""
                    infoPath.stringValue = ""
                    
                }
                else {
                    println("Can't open fileHandle \(err)")
                }
            }
            else {
                var err:NSError?
                if !encodingLine.writeToFile(fileurl, options: .DataWritingAtomic, error: &err) {
                    println("Can't write \(err)")
                }
            }

        }
        
    }
}

