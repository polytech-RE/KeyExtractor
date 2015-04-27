//
//  KeyExtractorTests.swift
//  KeyExtractorTests
//
//  Created by remy on 22/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Cocoa
import XCTest

class KeyExtractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFilePlist() {
        
        let path = "/Library/Preferences/com.microsoft.office.licensing.plist"
        XCTAssertNotNil(path,"problème d'initialisation du path")
        
        let filePlist : FilePlist
        filePlist = FilePlist(path: path)
        
        let key: String = "sequence"
        
        XCTAssertNotNil(filePlist,"problème du fichier Plist")
        
        XCTAssertNotNil(filePlist.path,"problème d'initialisation du path pour le fichier plist")
        XCTAssertEqual(filePlist.path, path, "problème le path du fichier plist différent du path donné")
        
        XCTAssertNotNil(filePlist.dictionary,"problème d'initialisation du dictionary pour le fichier plist")

        var value: AnyObject?
        value = filePlist.findValueAny(key)
        XCTAssertNotNil(value, "aucune valeur n'est associé à la clé")
        value = filePlist.findValueAny("toto")
        XCTAssertNil(value, "une valeur est associée à la clé")
        
        var stringValue: String?
        stringValue = filePlist.findValue(key)
        
        XCTAssertNotNil(stringValue, "aucune valeur n'est associé à la clé")
        stringValue = filePlist.findValue("toto")
        XCTAssertNil(stringValue, "une valeur est associée à la clé")
        
    }
    
    func testFileXML() {
        
       /* let path = "/Library/ApplicationSupport/Adobe/AdobePhotoshopCS6/AMT_Driver/application.xml"
        XCTAssertNotNil(path,"problème d'initialisation du path")
        
        let fileXML : FileXML
        fileXML = FileXML(path: path)
        
        let key: String = "PayloadCode"
        
        XCTAssertNotNil(fileXML,"problème du fichier xml")
        
        XCTAssertNotNil(fileXML.path,"problème d'initialisation du path pour le fichier xml")
        XCTAssertEqual(fileXML.path, path, "problème le path du fichier plist différent du path donné")
        
        XCTAssertNotNil(fileXML.xmlParser,"problème d'initialisation du dictionary pour le fichier xml")
    */
        //fileXML.parser(fileXML.xmlParser, foundCharacters: key)
    }

    func testFileFactory(){
        
        let pathWithoutNamePlist = "/Library/Preferences"
        let namePlist = "com.microsoft.office.licensing"
        let extPlist = "plist"
        
        XCTAssertNotNil(pathWithoutNamePlist,"problème d'initialisation du path")
        XCTAssertNotNil(namePlist,"problème d'initialisation du nom")
        XCTAssertNotNil(extPlist,"problème d'initialisation de l'extension")
        
        let filePlist: File
        filePlist = FileFactory.createFile(pathWithoutNamePlist, name: namePlist, ext: extPlist)!
        
        println(filePlist)
        let key = filePlist.findValue("sequence")
        
        /////////////////////////////////////////////////////////////////////////////////////////
        
        let pathWithoutName = "/Library/ApplicationSupport/Adobe/AdobePhotoshopCS6/AMT_Driver"
        let name = "application"
        let ext = "xml"
    
        XCTAssertNotNil(pathWithoutName,"problème d'initialisation du path")
        XCTAssertNotNil(name,"problème d'initialisation du nom")
        XCTAssertNotNil(ext,"problème d'initialisation de l'extension")
        /*
        let file: File
        file = FileFactory.createFile(pathWithoutName, name: name, ext: ext)!
        
        println(file)
        file.findValue("PayloadCode")
        */
        /////////////////////////////////////////////////////////////////////////////////////////
    }
    
}
