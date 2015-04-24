//
//  FilePlist.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FilePlist: File {
    
    //
    
    let path: String
    
    let dictionary : NSDictionary
    
    //initializers
    
    /*  Initialize the Abstract object File
        with the path 
    */
    init(path: String){
        self.path = path
        
        self.dictionary = NSDictionary(contentsOfFile: path)!;
    }
    
    //functions
    
    /*  This function allows to find a string value
        in a plist file.
        The plist file use a key-value system, ie
        for example, with the key licensing in a plist
        we can find a software licence
    */
    func findValue(key: String) -> String? {
        
        if ( self.dictionary.objectForKey(key) != nil ){
            
            let dictionaryTemp = self.dictionary.objectForKey(key)
            let value : String = String(stringInterpolationSegment: dictionaryTemp)
            return value

        }
        return nil
    }
    
        
}