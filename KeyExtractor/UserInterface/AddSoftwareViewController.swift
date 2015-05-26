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
    
    ///The software textfields
    @IBOutlet weak private var name: NSTextField!
    @IBOutlet weak private var licencePath: NSTextField!
    @IBOutlet weak private var format: NSPopUpButton!
    @IBOutlet weak private var infoPath: NSTextField!

    
    //Label to print message error
    @IBOutlet weak var nameError: NSTextField!
    @IBOutlet weak var licencePathError: NSTextField!
    @IBOutlet weak var informationPathError: NSTextField!

    // MARK: Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        }

    // MARK: Functions
    
    @IBAction func send(sender: AnyObject) {
        
        //clean value
        nameError!.stringValue = ""
        licencePathError!.stringValue  = ""
        informationPathError!.stringValue = ""
        
        //check the fields
        if(name.stringValue == ""){
            nameError!.stringValue = "fill the field name"
        }
        if(licencePath.stringValue == ""){
            licencePathError!.stringValue = "fill the field licence path"
        }
        if(infoPath.stringValue == ""){
            informationPathError!.stringValue = "fill this field"
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
                //TODO ERROR
        }

        // record information
        if( name != "" && licencePath != "" && infoPath != ""){
            
            let line: String
            line = name.stringValue + ";" + licencePath.stringValue + ";" + formatValue + "\n"
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
                    println(encodingLine)
                    fileHandle.closeFile()
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

