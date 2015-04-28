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
    
    let path: String
    
    // var to parse an XMLData
    var parser = NSXMLParser()
    let xmlParser : NSXMLParser
    
    var elementName: String
    var licence: String
    
    
    //initializers
    
    /*  Initialize the Abstract object File
    with the path
    */
    init(path: String){
        self.path = path
        let data: NSData = NSData(contentsOfFile: path)!
        //TODO mettre une exception pour le Data
        self.licence = String()
        self.elementName = String()
        self.xmlParser = NSXMLParser(data: data)
        self.xmlParser.parse()
        
    }
    
    //functions
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        self.elementName = elementName
        
        println("cecie est un test")

        if self.elementName == "sequence" {
            println("cecie est un test")
            self.licence = "test"
        }
        
    }
    /*
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        let data = string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if (!data.isEmpty) {
            if self.elementName == "sequence" {
                self.licence += data
            }
        }
    }
    */
    /*
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }*/
    
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