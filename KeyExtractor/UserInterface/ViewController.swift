//
//  ViewController.swift
//  KeyExtractor
//
//  Created by remy on 22/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var licencePath: NSTextField!
    @IBOutlet weak var format: NSPopUpButton!
    @IBOutlet weak var infoPath: NSTextField!

    
    //Label to print message error
    @IBOutlet weak var nameError: NSTextField!
    @IBOutlet weak var licencePathError: NSTextField!
    @IBOutlet weak var informationPathError: NSTextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        let dir:NSURL = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.CachesDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
        
        let fileurl = dir.URLByAppendingPathComponent("ways.txt")
        */
        }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


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
            informationPathError!.stringValue = "fill the field information path"
        }
        
        // record information
        if( name != "" && licencePath != "" && infoPath != ""){
            
            let line: String
            line = name.stringValue + ";" + licencePath.stringValue + ";" + infoPath.stringValue + "\n"
            let encodingLine = line.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!
    
            let dir:String = NSFileManager.defaultManager().currentDirectoryPath

            println()
            let fileurl = dir + "/ways.txt"
            
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

