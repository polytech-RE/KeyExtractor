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
        println("currentValue : \(currentValue)")
        currentValue = ""
        //TODO sauver la currentValue si elle ressemble à une clé
    }
}