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
        
        if let dic = NSDictionary(contentsOfFile: path) {
            self.dictionary = dic
        }
        else{
            self.dictionary = NSDictionary()
            NSException(name: "file not exist", reason: "error while the execution (open)", userInfo: nil)
        }
        
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
            
            let value: String = (self.dictionary.objectForKey(key) as! String?)!

            return "\(value)"

        }
        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
    func findValueAny(key: String) -> AnyObject? {
        
        if ( self.dictionary.objectForKey(key) != nil ){
            
            let dictionaryTemp: AnyObject
            dictionaryTemp = self.dictionary.valueForKey(key)!
            
            return dictionaryTemp
            
        }
        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
        
}