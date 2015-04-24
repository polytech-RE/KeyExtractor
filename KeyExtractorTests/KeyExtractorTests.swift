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
        
        XCTAssertNotNil(filePlist,"problème du fichier Plist")
        
        XCTAssertNotNil(filePlist.path,"problème d'initialisation du path pour le fichier plist")
        XCTAssertEqual(filePlist.path, path, "problème le path du fichier plist différent du path donné")
        
        XCTAssertNotNil(filePlist.dictionary,"problème d'initialisation du dictionary pour le fichier plist")

        var value: AnyObject?
        value = filePlist.findValueAny("sequence")
        XCTAssertNotNil(value, "aucune valeur n'est associé à la clé")
        value = filePlist.findValueAny("toto")
        XCTAssertNil(value, "une valeur est associée à la clé")
        
    }
    
}
