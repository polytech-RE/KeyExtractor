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
                
                let softwareName: String
                let softwareLicenceFilePath: String
                let softwareInfoFilePath: String
                let softwareVersion: String?
                
                //TODO try and cath pour lever l'erreur lorsque le fichier est mal rempli
                softwareName = separatedsemicolon[0]
                softwareLicenceFilePath = separatedsemicolon[1]
                softwareInfoFilePath = separatedsemicolon[2]
                
                //create the software with the information
                
                let fileInfo: FilePlist?
                fileInfo = FilePlist(path: softwareInfoFilePath)
                
                softwareVersion = fileInfo?.findValue("CFBundleShortVersionString")
                fileInfo?.findValue("FBundleVersion")
                fileInfo?.findValue("NSHumanReadableCopyright")
                
                println("version")
                println(softwareVersion)

                let software :Software
                software = Software(name: softwareName , vendor: "", version: "", computerName: "", userName: "", key: "", keyRegistryPath: "" , keyRegistryValue: "")
                
                softwareList.append(software)
                
            }
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
