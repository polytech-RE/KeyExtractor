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
    @IBOutlet weak var licensepath: NSTextField!
    @IBOutlet weak var format: NSPopUpButton!
    @IBOutlet weak var infopath: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func send(sender: AnyObject) {
        // recuperer champ
        // enrengister fichier
        
    }
}

