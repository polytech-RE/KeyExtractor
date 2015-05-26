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
        
        //let path = "/Library/Preferences/com.microsoft.office.licensing.plist"
        let path = "/Library/Preferences/com.druide.Antidote.plist"
        XCTAssertNotNil(path,"problème d'initialisation du path")
        
        let filePlist : FilePlist
        filePlist = FilePlist(path: path)
        
        let key: String = "noDeSerie"
        
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
        
        //let path = "/Library/Application Support/Adobe/Adobe Photoshop CS6/AMT_Driver/application.xml"
        let path = "/Users/remy/Desktop/Lightroom 5.0 Registration.xml"
        //let path = "/Users/remy/Desktop/application.xml"
        //let path = "/Users/polytech/Desktop/application.xml"
        
        XCTAssertNotNil(path,"problème d'initialisation du path")
        
        let data: NSData = NSData(contentsOfFile: path)!
        //println("\(data)")
        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        //println("\(str)")
        
        
        let fileXML : FileXML
        fileXML = FileXML(path: path)
        fileXML.startParsing()
        println("FOUND KEY : \(fileXML.licence)")
        
        XCTAssertNotNil(fileXML,"problème du fichier XML")
        XCTAssertNotNil(fileXML.path,"problème d'initialisation du path pour le fichier xml")
        XCTAssertEqual(fileXML.path, path, "problème le path du fichier plist différent du path donné")
        
        let key: String = "serial_number"

    }
    
    func testFileWays(){
        let path =  "/Users/remy/Documents/LINXYA/trunk/linxya_key_extractor/ways.txt"
        XCTAssertNotNil(path,"problème d'initialisation du path")
        
        let fileTXT : FileTXT
        fileTXT = FileTXT(path: path)
        
        XCTAssertNotNil(fileTXT,"problème du fichier txt")
        
        XCTAssertNotNil(fileTXT.path,"problème d'initialisation du path pour le fichier txt")
        XCTAssertEqual(fileTXT.path, path, "problème le path du fichier plist différent du path donné")
        
        XCTAssertNotNil(fileTXT.content,"problème d'initialisation du dictionary pour le fichier txt")
        
    }
    
    func testFileTXT(){
        let path =  "/Library/Preferences/VMware Fusion/license-fusion-70-e3-201404"
        let format = "txt"
        
        XCTAssertNotNil(path,"problème d'initialisation du path")
        XCTAssertNotNil(format,"problème d'initialisation du format")
        
        let fileTXT : FileTXT
        fileTXT = FileTXT(path: path)
        
        XCTAssertNotNil(fileTXT,"problème du fichier txt")
        
        XCTAssertNotNil(fileTXT.path,"problème d'initialisation du path pour le fichier txt")
        XCTAssertEqual(fileTXT.path, path, "problème le path du fichier txt différent du path donné")
        
        XCTAssertNotNil(fileTXT.content,"problème d'initialisation du content pour le fichier txt")
        
        let key = "Serial"
        
        var stringValue: String?
        stringValue = fileTXT.findValue(key)
        XCTAssertNotNil(stringValue, "aucune valeur n'est associé à la clé")
        println("ma clé")
        println(stringValue)
        
        stringValue = fileTXT.findValue("toto")
        XCTAssertNil(stringValue, "une valeur est associée à la clé")
        
    }

    func testFileFactory(){
        
        let pathPlist = "/Library/Preferences/com.microsoft.office.licensing.plist"
        let formatPlist = "plist"
        
        XCTAssertNotNil(pathPlist,"problème d'initialisation du path")
        XCTAssertNotNil(formatPlist,"problème d'initialisation du format")
        
        let filePlist: File
        filePlist = FileFactory.createFile(pathPlist, format: formatPlist)!
        
        let key = filePlist.findValue("sequence")
        
        /////////////////////////////////////////////////////////////////////////////////////////
        
        let path = "/Library/ApplicationSupport/Adobe/AdobePhotoshopCS6/AMT_Driver/application.xml"
        let format = "xml"
    
        XCTAssertNotNil(path,"problème d'initialisation du path")
        XCTAssertNotNil(format,"problème d'initialisation du format")
        /*
        let file: File
        file = FileFactory.createFile(path, format: format)!
        
        println(file)
        file.findValue("PayloadCode")
        */
        /////////////////////////////////////////////////////////////////////////////////////////
    }
    
    
    func testSoftwareManager(){
        let softwareManager: SoftwareManager = SoftwareManager()
        softwareManager.fileSeek()
    }
    
    func testSoftwareManager2(){
        let softwareManager: SoftwareManager = SoftwareManager()
        softwareManager.fileSeek()
        println("software:")
        println(softwareManager.getSoftwares().first?.getCopyright())
    }
}
