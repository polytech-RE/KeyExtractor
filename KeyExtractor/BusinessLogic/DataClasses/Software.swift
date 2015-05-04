//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class Software {
    
    /*
    The software name
    */
    private var name : String
    
    /*
    The software copyright
    */
    private var copyright : String

    /*
    The software version
    */
    private var version : String
    
    /*
    The software  (ex 'AAA-BBBB-CCCCC-EEEEE')
    */
    private var key : String
    
    //private var keys: Set<SoftwareKey> //Set<SoftwareKey>
    
    init(name: String, copyright: String, version: String, key: String) {
        self.name = name
        self.copyright = copyright
        self.version = version
        self.key = key
        //self.keys = Set()
    }
    

}