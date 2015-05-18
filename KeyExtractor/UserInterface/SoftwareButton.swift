//
//  SoftwareButton.swift
//  KeyExtractor
//
//  Created by remy on 12/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

class SoftwareButton: NSButton {
    
    @IBOutlet weak var checkbox: NSButtonCell!

    func load( val: Int){
        self.checkbox.state = val
    }
    
    func getState() -> Int {
        return self.checkbox.state
    }
    
    @IBAction func addToSell(sender: NSButtonCell) {
        if checkbox.state == 1 {
            println("je met le software à vendre")
        }
        else {
            println("je le passe à zéro")
        }
    }
}