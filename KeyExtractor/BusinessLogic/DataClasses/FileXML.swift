//
//  FileXML.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileXML: NSObject, File{
    
    let path: String
    let xmlParser : NSXMLParser
    var elementName: String
    var licence: String
    
    
    /*  Initialize the Abstract object File
    with the path
    */
    init(path: String){
        self.path = path

        self.licence = String()
        self.elementName = String()
        
        let data: NSData = NSData(contentsOfFile: path)!
        //TODO mettre une exception pour le Data
        
        self.xmlParser = NSXMLParser(data: data)
        self.xmlParser.delegate = myXMLParserDelegate(path: path)
        self.xmlParser.parse()
    }
    
    func findValue(key: String) -> String? {
        return ""
    }

}