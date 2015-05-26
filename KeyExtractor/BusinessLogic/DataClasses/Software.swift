//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

/// Software usually refers to instructions for computer hardware to execute
public class Software {
    
    ///The software name
    private var name : String
    
    
    ///The software copyright
    private var copyright : String

    ///The software version
    private var version : String
    
    ///The software key (ex 'AAA-BBBB-CCCCC-EEEEE')
    private var key : String
    
    /**
    This attribute allows to know the state of a software.

        - 1 : The user would like to sell the software
        - 0 : The user would like to keep the software
    */
    private var sell : Int
    
    /**
    Initializes a new software with the information and specifications.
    
    :param: name The software name
    :param: copyright The software copyright
    :param: version The software version
    :param: key The software key (ex 'AAA-BBBB-CCCCC-EEEEE')

    
    :returns: A software with all the information.
    */
    init(name: String, copyright: String, version: String, key: String) {
        self.name = name
        self.copyright = copyright
        self.version = version
        self.key = key
        self.sell = 0
    }
    
    // MARK: Getters
    
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