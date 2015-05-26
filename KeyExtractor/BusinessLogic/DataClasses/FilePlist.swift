//
//  FilePlist.swift
//  KeyExtractor
//
//  Created by remy on 24/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

///It's a representation of an file object, whitch is written with the plist format.
class FilePlist: File {
    
    // MARK: Attributes
    
    ///file path
    let path: String
    
    ///content of the file as dictionary
    let dictionary : NSDictionary
    
    // MARK: Initializers
    
    /**
    Initializes a new FilePlist with the information and specifications.
    This object follows the protocole File.The dictionary is initialize
    with the content of the file.
    
    :param: path The path of the file
    
    :returns: A FilePlist with all the information.
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
    
    // MARK: functions
    
    /** 
        This function allows to find a string value
        in a plist file.
        The plist file use a key-value system, ie
        for example, with the key licensing in a plist
        we can find a software licence
    
        :param: key The key witch is associated with the licence
    
        :returns: the value associated to the key
    */
    func findValue(key: String) -> String? {
        
        if ( self.dictionary.objectForKey(key) != nil ){
            
            let value: String = (self.dictionary.objectForKey(key) as! String?)!

            return "\(value)"

        }
        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
    /**
    This function allows to find a string value
    in a plist file.
    The plist file use a key-value system, ie
    for example, with the key licensing in a plist
    we can find a software licence
    
    :param: key The key witch is associated with the licence
    
    :returns: the value associated to the key as a generic object
    */
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