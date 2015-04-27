//
//  FileXML.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileXML: NSObject, File ,NSXMLParserDelegate {
    
    //
    
    // var to parse an XMLData
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
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
        self.xmlParser.parse()
    }
    
    //functions
    
    func parser(parser: NSXMLParser, key: String)
    {
        if element.isEqualToString(key) {
            
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, key: String)
    {
        if (elementName as NSString).isEqualToString(key) {
                posts.addObject(elements)
        }
    }
    
    /*  This function allows to find a string value
    in a xml file.
    The xml file use a markup system, ie
    for example, with the markup sequence in a xml
    we can find a software licence
    */
    
    func findValue(key: String) -> String? {
        
        return nil
    }
    
    
    
}