//
//  SoftwareButton.swift
//  KeyExtractor
//
//  Created by remy on 12/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

///Represents the button associated with a software. The button modify the state of the software.
class SoftwareButton: NSButton {
    
    // MARK: Attributes
    
    ///Represents the checkbox (in the button)
    @IBOutlet weak private var checkbox: NSButtonCell!

    // MARK: Functions
    
    /**
    This method allows to initialize the state of the checkbox
    
    :param: software The software associated with the button
    */
    func loadItem(software: Software){
        self.checkbox.representedObject = software
        self.checkbox.state = software.getSell()
    }
    
    /**
    This method allows to get the state of the checkbox.
    
    :returns: The value corresponding to the software's state
    */
    func getState() -> Int {
        return self.checkbox.state
    }
    
    /**
    This method allows to get the software associated with the checkbox.
    
    :returns: The software associated with the checkbox
    */
    func getRepresentatedObject() -> Software?{
       return self.checkbox.representedObject as? Software
    }
    
}