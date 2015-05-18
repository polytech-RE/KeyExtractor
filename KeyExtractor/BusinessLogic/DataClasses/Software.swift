//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

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
        //self.keys = Set()
    }
    
    //Getters
    
    /*
    getter for name
    */
    public func getName() -> String{
        
        return self.name
    }
    
    /*
    getter for copyright
    */
    public func getCopyright() -> String{
        
        return self.copyright
    }
   
    /*
    getter for version
    */
    public func getVersion() -> String{
        
        return self.version
    }
    
    /*
    getter for key
    */
    public func getKey() -> String{
        
        return self.key
    }
    
    /*
    getter for the sell value
    */
    public func getSell() -> Int{
        
        return self.sell
    }

}