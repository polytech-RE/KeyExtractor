//
//  FileTXT.swift
//  KeyExtractor
//
//  Created by remy on 28/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation


class FileTXT: File {
    
    ///file path
    let path: String
    
    ///file content
    let content : String?
    
    
    /**
    Initializes a new FileTXT with the information and specifications.
    This object follows the protocole File
    
    :param: path The path of the file
    :param: content The content of the file
    
    :returns: A FileTXT with all the information.
    */
    init(path: String){
        self.path = path
        var err: NSError? = NSError()
        self.content = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &err)
    }
    

    /**
    This method searches in the file the value of a licence key.

    :param: key The key witch is associated to the licence
    
    :returns: the value associated to the key
    */
    func findValue(key: String) -> String? {
        
        if ( self.contentNotNil() ){
            
            //split the file with the new line character
            let separatedLine = split(self.content!, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c=="\n"})
            
            for line in separatedLine {
                
                //we chooses the line which contains the key
                if line.rangeOfString(key) != nil {
                    //the line contains the key
                    
                    var rigthPart: String
                    //we take the part after the key in this line
                    rigthPart = line.componentsSeparatedByString(key)[1]
                    
                    var serialKey = String()
                    
                    //for all the the character in this string
                    for scalar in rigthPart.unicodeScalars {
                        let value = scalar.value
                        
                        //we delete special character
                        //if is alpha (between (65 and 90) and (97 and 122))
                        //or if is digit (between 48 and 57)
                        // or is a dash sign (45)
                        if (value >= 65 && value <= 90) || (value >= 97 && value <= 122) || (value >= 48 && value <= 57) || (value == 45){
                            serialKey.append(scalar)
                        }
                    }
                    return serialKey
                }
            }
        }
        
        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
    /**
    This method allows to know if the content of the file is nil.
    
    :returns: true if the content is not nil
    */
    func contentNotNil() -> Bool {
        
        return self.content != nil;
    }
    
}