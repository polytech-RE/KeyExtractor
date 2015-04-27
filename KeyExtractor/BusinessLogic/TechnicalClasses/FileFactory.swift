//
//  FileManager.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class FileFactory {

    func static createFile(PathWithoutName,name,ext):File{
    
        switch ext{
            case "xml":
                return FileXML(PathWithoutName,name)
            case "plist:"
                return FilePList(PathWithoutName,name)
        }
    }
}