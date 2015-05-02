//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class Software {
    
    private var name : String
    private var vendor : String
    private var InstallLocation: String
    private var version : String
    
    //private var keys: Set<SoftwareKey> //Set<SoftwareKey>
    
    /*
    The licence key (ex 'AAA-BBBB-CCCCC-EEEEE')
    */
    private var key : String
    
    /*
    Registry path of the licence key
    */
    private var keyRegistryPath: String
    
    /*
    Registry value which contains the licence key (ex 'ProductID')
    */
    private var keyRegistryValue: String
    
    private var userName: String
    
    init(name: String, vendor: String, version: String, computerName: String, userName: String, key: String, keyRegistryPath: String, keyRegistryValue: String) {
        self.name = name
        self.vendor = vendor
        self.version = version
        self.userName = userName
        self.key = key
        self.keyRegistryPath = keyRegistryPath
        self.keyRegistryValue = keyRegistryValue
        //self.keys = Set()
        self.InstallLocation = String()
    }
    

}