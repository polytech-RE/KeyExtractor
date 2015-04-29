//
//  FileXML.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileXML: NSObject, File, NSXMLParserDelegate{
    
    let path: String
    var licence: String?
    var currentKey: AnyObject?
    var currentValue: String
    
    
    /*  Initialize the Abstract object File
    with the path
    */
    init(path:String){
        self.currentValue = String()
        self.path = path
        self.licence = String()
    }
    
    func findValue(key: String) -> String? {
        return ""
    }
    
    func startParsing(){
            let data: NSData = NSData(contentsOfFile: path)!
            var objNSXMLParser = NSXMLParser(data: data)
            objNSXMLParser.delegate = self
            objNSXMLParser.parse()
    }

    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        println("Element's name is \(elementName)")
        println("Element's attributes are \(attributeDict)")
        currentKey=attributeDict.values.first
        println(currentKey)
        println("\(currentKey)")
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if "\(currentKey)"=="Optional(PayloadCode)"{
            currentValue += string ?? String()
            let newValue = currentValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            licence = newValue == String() ? nil : newValue
        }
    }
}