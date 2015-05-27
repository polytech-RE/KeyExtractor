//
//  SoftwareCell.swift
//  KeyExtractor
//
//  Created by remy on 06/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

///Represents a generic software Cell (used for the name, the version, the copyright and the key)
class SoftwareCell: NSTableCellView {
    
    // MARK: Attributes
    
    ///represents the text field in the cell (connected to the storyboard)
    @IBOutlet weak private var softwareText: NSTextField!
    
    // MARK: Functions
    
    /**
    This method allows to initialize the text in the cell.
    
    :param: text The text to display in the cell
    */
    func loadItem(text: String) {
        softwareText.stringValue = text
    }
}