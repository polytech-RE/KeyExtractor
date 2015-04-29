//
//  FileTXT.swift
//  KeyExtractor
//
//  Created by remy on 28/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation


class FileTXT: File {
    
    //
    
    let path: String
    
    let content : String?
    
    //initializers
    
    /*  Initialize the Abstract object File
    with the path
    */
    init(path: String){
        self.path = path
        var err: NSError? = NSError()
        self.content = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &err)
        println(self.content)
    }
    
    //functions

    func findValue(key: String) -> String? {
        
        return nil;
    }
    
    /*return true if the content isn't nil*/
    func contentNotNil() -> Bool {
        
        return self.content != nil;
    }
    
}