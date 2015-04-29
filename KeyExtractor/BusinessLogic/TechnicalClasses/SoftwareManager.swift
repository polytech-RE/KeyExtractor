//
//  SoftwareManager.swift
//  KeyExtractor
//
//  Created by remy on 28/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class SoftwareManager {
    
    private let pathListFile: String
    private var softwareList: [Software]
    
    init(){
        
        self.pathListFile = "/Users/remy/Documents/LINXYA/trunk/linxya_key_extractor/ways.txt"
        self.softwareList = [Software]()
        
    }
    
    func test()-> Software? {
    
        let file: FileTXT?
        file = FileTXT(path: pathListFile)
        
        if ( file!.contentNotNil() ){
            
            //split the file with the new line character
            let separatedline = split(file!.content!, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c=="\r\n"})
        
            for line in separatedline {
                
                //split the file with the character ;
                // the file is formated as softwareName;version;
                let separatedsemicolon = split(file!.content!, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c=="\r\n"})
                
                //create the software with the information
                
                let software :Software
                software = Software(name: separatedsemicolon[0] , vendor: "", version: "", computerName: "", userName: "", key: "", keyRegistryPath: separatedsemicolon[1] , keyRegistryValue: "")
                
                //TODO: recherche des autres informations dans /APP
                
                softwareList.append(software)
                
            }
            
            /*let separated2 = self.content!.componentsSeparatedByString(key)*/
        }

        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    

}
