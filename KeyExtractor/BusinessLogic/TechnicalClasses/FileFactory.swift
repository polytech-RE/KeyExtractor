//
//  FileManager.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

///In class-based programming, the factory method pattern is a creational pattern which uses factory methods to deal with the problem of creating objects without specifying the exact class of object that will be created. We use this pattern to create a file. For each format, we create a file.

class FileFactory {

    /**
    This method allows to create a File.
    
    This function checks if the path exists 
    and create the appropriated file with the format
    
    :param: path The path of the file
    
    :param: format The format of the file:
    
        - xml
        - plist
        - txt
    
    :returns: a File
    */

    static func createFile(path: String, format: String) -> File?{
        
        var checkValidation = NSFileManager.defaultManager()
        
        //we check if the file exists
        if(checkValidation.fileExistsAtPath(path)){
            
            switch format{
            case "xml":
                return FileXML(path: path)
            case "plist":
                return FilePlist(path: path)
            case "txt":
                return FileTXT(path: path)
            default:
                NSException(name: "extension", reason: "the extension isn't implemented", userInfo: nil)
                return nil
            }
        }
        else{
            NSLog("Path not correct")
            NSException(name: "file not exists", reason: "the path isn't correct", userInfo: nil)
            return nil
        }
    }
}
