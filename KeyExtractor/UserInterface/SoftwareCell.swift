//
//  SoftwareCell.swift
//  KeyExtractor
//
//  Created by remy on 06/05/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa

class SoftwareCell: NSTableCellView {
    
    @IBOutlet weak var softwareName: NSTextField!
    func loadItem(name: String) {
        softwareName.stringValue = name
    }
}