//
//  FileXML.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

///It's a representation of an file object, whitch is written with the XML language.
class FileXML: NSObject, File, NSXMLParserDelegate{
    
    // MARK: Attributes
    
    ///file path
    let path: String
    
    
    var licence: String?
    
    ///current key observed
    var currentKey: AnyObject?
    
    ///the value associated with the current key
    var currentValue: String
    
    // MARK: Initializers
    
    /**
    Initializes a new FileXML with the information and specifications.
    This object follows the protocole File.
    
    :param: path The path of the file
    
    :returns: A FileXML with all the information.
    */
    init(path:String){
        self.currentValue = String()
        self.path = path

        self.licence = String()
    }
    
    // MARK: functions
    
    func findValue(key: String) -> String? {
        return ""
    }
    
    func startParsing(){
            println("ATTENTION BLABLALBALBLABLABLALB : \(path)")
        
        if let data: NSData = NSData(contentsOfFile: path) {
            var objNSXMLParser = NSXMLParser(data: data)
            objNSXMLParser.delegate = self
            objNSXMLParser.parse()
        }
        else{
            NSException(name: "openFile", reason : "unknown", userInfo: nil)
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        currentKey=("\(elementName) \(attributeDict.values.array)")
        println("currentKey : \(currentKey!)")
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        currentValue += string ?? String()
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        println("{currentValue : \(currentValue)}")
        if testKey(currentValue){
            println("KEY FOUND : \(currentValue)")
        }
        currentValue = ""                  
        
    }
    func testKey(content:String) -> Bool {
        var regex = "^[a-zA-Z0-9]+[-]{1}[a-zA-Z0-9|[-]]*[a-zA-Z0-9]+$"
        if let match = content.rangeOfString(regex, options: .RegularExpressionSearch) {
            return true
        }
        return false
    }
}