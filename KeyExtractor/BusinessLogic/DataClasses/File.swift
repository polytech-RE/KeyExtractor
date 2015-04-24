//
//  File.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

/*no abstract class in swift
we must use protocol 
A File corresponds to an "abstract" object
which contains the file's path on the
hard drive.
*/
protocol File{
    
    /*  The file's path */
    var path: String { get }
    
    func findValue(String) -> String?
    
}
