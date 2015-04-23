//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class Software {
    
    private var name
    private var vendor
    private var version
    private var computerName
    private var scanTime

/**
* The licence key (ex 'AAA-BBBB-CCCCC-EEEEE')
*/
    private key

/**
* Registry path of the licence key
*/
    private keyRegistryPath

/**
* Registry value which contains the licence key (ex 'ProductID')
*/
    private keyRegistryValue

public Software(String name, String vendor, String version, String computerName, String scanTime, String userName, String key, String keyRegistryPath, String keyRegistryValue) {
    self.name = name;
    self.vendor = vendor;
    self.version = version;
    this.computerName = computerName;
    this.scanTime = scanTime;
    this.userName = userName;
    this.key = key;
    this.keyRegistryPath = keyRegistryPath;
    this.keyRegistryValue = keyRegistryValue;
}
}