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
        
        self.pathListFile = "/Users/remy/Desktop/ways.txt"
        self.softwareList = [Software]()
        
    }
    
    
    /*This function allows to find the software present in the file txt */
    func fileSeek()-> Software? {
    
        let file: FileTXT?
        file = FileTXT(path: pathListFile)
        
        if ( file!.contentNotNil() ){
            
            //split the file with the new line character
            let separatedline = split(file!.content!, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c=="\n"})
            
            for line in separatedline {
                
                //split the file with the character ;
                // the file is formated as softwareName;licenceFile;infoFile
                let separatedsemicolon = split(file!.content!, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c==";"})
                
                println("separated line")
                println(separatedsemicolon)
                //create the software with the information
                
                //TODO: recherche des autres informations dans /APP
                
                let software :Software
                software = Software(name: separatedsemicolon[0] , vendor: "", version: "", computerName: "", userName: "", key: "", keyRegistryPath: separatedsemicolon[1] , keyRegistryValue: "")
                
                softwareList.append(software)
                
            }
            
            /*let separated2 = self.content!.componentsSeparatedByString(key)*/
        }

        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
    /*  This function alows to find all the software
        with licence in  the basic folder (maybe
        /Library/Preferences)
    */
    func autoSeek()-> Software? {
    
        return nil
    }

}
