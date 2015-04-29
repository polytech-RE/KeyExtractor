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
    }
    
    //functions

    func findValue(key: String) -> String? {
        
        if ( self.content != nil ){
            self.content?.rangeOfString(key)
        }
        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
}