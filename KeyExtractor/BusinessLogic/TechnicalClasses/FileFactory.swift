//
//  FileManager.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileFactory {
    
    static func createFile(pathWithoutName: String, name: String, ext: String) -> File?{
    
        let path: String
        path = pathWithoutName + "/" + name + "." + ext

        switch ext{
            case "xml":
                return FileXML(path: path)
            case "plist":
                return FilePlist(path: path)
            
            default:
                NSException(name: "extension", reason: "the extension isn't implemented", userInfo: nil)
                return nil
        }

        return nil;
    }
}
