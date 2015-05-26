//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

/*!
@header Software.swift
*/

import Foundation

public class Software {
    
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
    The software key (ex 'AAA-BBBB-CCCCC-EEEEE')
    */
    private var key : String
    
    /*
    attribute to know if the software is to sell
    */
    private var sell : Int
    
    //private var keys: Set<SoftwareKey> //Set<SoftwareKey>
    
    init(name: String, copyright: String, version: String, key: String) {
        self.name = name
        self.copyright = copyright
        self.version = version
        self.key = key
        self.sell = 0
    }
    
    //Getters
    
    /**
    This method get the name of a software.
    
    :returns: the software name
    */
    public func getName() -> String{
        
        return self.name
    }

    /**
    This method get the copyright of a software.
    
    :returns: the software copyright
    */
    public func getCopyright() -> String{
        
        return self.copyright
    }
   
    /**
    This method get the version of a software.
    
    :returns: the software version
    */
    public func getVersion() -> String{
        
        return self.version
    }
    
    /**
    This method get the key of a software.
    
    :returns: the software key
    */
    public func getKey() -> String{
        
        return self.key
    }
    
    /**
    This method get the state of a software.
    
        - 1 : The user would like to sell the software
        - 0 : The user would like to keep the software
    
    :returns: the software state
    */
    public func getSell() -> Int{
        
        return self.sell
    }
    
    /**
    This method allows to set the state of a software.
    
    - 1 : The user would like to sell the software
    - 0 : The user would like to keep the software
    
    :params: the software state (0 or 1)
    */
    public func setSell(val: Int) {
        
        self.sell = val
    }

}