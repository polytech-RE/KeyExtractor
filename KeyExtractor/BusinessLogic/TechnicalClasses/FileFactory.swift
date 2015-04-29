//
//  FileManager.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileFactory {

    static func createFile(PathWithoutName: String, name: String, ext: String) -> File?{
    
        let path: String
        path = PathWithoutName + name + ext
        /*
        switch ext{
            case "xml":
                return FileXML(path: path)
            case "plist:":
                return FilePlist(path: path)
            
            default:
                NSLog("probleme the format isn't implemented")
                //TODO Exception
        }
        */
        return nil;
    }
}
