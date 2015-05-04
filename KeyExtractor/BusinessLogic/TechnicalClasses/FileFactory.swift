//
//  FileManager.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileFactory {

    static func createFile(path: String, format: String) -> File?{
        
        var checkValidation = NSFileManager.defaultManager()
        
        if(checkValidation.fileExistsAtPath(path)){
            
            switch format{
            case "xml":
                return FileXML(path: path)
            case "plist":
                return FilePlist(path: path)
            case "txt":
                return FilePlist(path: path)
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
