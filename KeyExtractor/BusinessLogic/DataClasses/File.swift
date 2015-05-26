//
//  File.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

///There is no abstract class in swift we must use protocol. A File corresponds to an "abstract" object which contains the file's path on the hard drive.

protocol File{
    
    // MARK: Attributes
    
    ///  The file's path
    var path: String { get }
    
    // MARK: Initializers
    
    // MARK: functions
    
    /**
    This function allows to find a string value
    in a file associated with a key.
    
    :param: key The key witch is associated with the licence
    
    :returns: the value associated to the key
    */
    func findValue(String) -> String?
    
}
