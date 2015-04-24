//
//  FileXML.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileXML: File {
    
    //
    
    let path: String
    
    let xmlParser : NSXMLParser
    
    //initializers
    
    /*  Initialize the Abstract object File
    with the path
    */
    init(path: String){
        self.path = path
        let data: NSData = NSData(contentsOfFile: path)!
        self.xmlParser = NSXMLParser(data: data)
        
    }
    
    //functions
    
    /*  This function allows to find a string value
    in a xml file.
    The xml file use a markup system, ie
    for example, with the markup sequence in a xml
    we can find a software licence
    */
    
    
    func findValue(key: String) -> String? {
        self.xmlParser.
        return nil
    }



}