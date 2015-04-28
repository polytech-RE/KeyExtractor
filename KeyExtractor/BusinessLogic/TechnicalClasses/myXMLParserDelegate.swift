//
//  myXMLParser.swift
//  KeyExtractor
//
//  Created by polytech on 27/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class myXMLParserDelegate: NSObject, NSXMLParserDelegate{
    
    var path:String
    
    init(path:String){
        self.path = path
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        println("Element's name is \(elementName)")
        println("Element's attributes are \(attributeDict)")
    }
}