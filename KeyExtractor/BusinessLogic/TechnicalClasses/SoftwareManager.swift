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
        
        //TODO emplacement fichier (dans le logiciel?)
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
                let separatedsemicolon = split(line, allowEmptySlices: false,  isSeparator: {(c:Character)->Bool in return c==";"})
                
                let fileInfo: File?
                let fileLicence: File?
                
                let softwareName: String
                let softwareLicenceFilePath: String
                let softwareLicenceFileFormat: String
                let softwareLicenceKeyName: String
                let softwareKey: String?
                let softwareInfoFilePath: String
                let softwareVersion: String?
                let copyright: String?
                
                //TODO try and cath pour lever l'erreur lorsque le fichier est mal rempli
                softwareName = separatedsemicolon[0]
                softwareLicenceFilePath = separatedsemicolon[1]
                softwareLicenceFileFormat = separatedsemicolon[2]
                softwareLicenceKeyName = separatedsemicolon[3]
                softwareInfoFilePath = separatedsemicolon[4]
                
                //get the software information
                //if ( softwareInfoFilePath && softwareLicenceKeyName  && softwareLicenceFileFormat  && softwareLicenceFilePath ){
                  
                fileInfo = FilePlist(path: softwareInfoFilePath)
                
                if ( fileInfo != nil){
                    softwareVersion = fileInfo?.findValue("CFBundleShortVersionString")
                    copyright = fileInfo?.findValue("NSHumanReadableCopyright")
                    
                    if (softwareVersion != nil && copyright != nil){
                        println("version")
                        println(softwareVersion)
                        println("copyright")
                        println(copyright)

                
                        //get the software information
                        println("File Path")
                        println(softwareLicenceFilePath)
                        println("File Format")
                        println(softwareLicenceFileFormat)
                
                        fileLicence = FileFactory.createFile(softwareLicenceFilePath, format: softwareLicenceFileFormat)
                
                        if (fileLicence != nil){
                            println("Key Name")
                            println(softwareLicenceKeyName)
                
                            softwareKey = fileLicence?.findValue(softwareLicenceKeyName)
                
                            println("software Key")
                            println(softwareKey)
                            if softwareKey != nil {
                                //create the software with the information
                                let software :Software
                                software = Software(name: softwareName, copyright: copyright!, version: softwareVersion!, key: softwareKey!)
                        
                            softwareList.append(software)
                            }
                            else{

                            //TODO error clé non trouvée
                            }
                        }
                        else{
                        
                            //TODO error ouverture
                        }
                    }
                    else{
                        //version et copyright
                    }
                }
                else{
                    softwareVersion = nil
                    copyright = nil
                    //TODO erreur ouverture fichier info
                }
            }
        }

        NSException(name: "Nil File", reason: "The file isn't initialized (nil)", userInfo: nil)
        return nil
    }
    
    /*  This function allows to find all the software
        with licence in  the basic folder (maybe
        /Library/Preferences)
    */
    func autoSeek()-> Software? {
        var currentFile:FileXML
        var currentPath:String
        let fileManager: NSFileManager = NSFileManager()
        if let files = fileManager.subpathsAtPath("/Library/Preferences/") as? [String]{
            for file in files{
                currentPath = "/Library/Preferences/\(file)"
                if file.pathExtension == "plist" {
                    currentFile=FileXML(path: currentPath)
                    currentFile.startParsing()
                }
            }
        }
        return nil
    }
    
    func getSoftwares() ->[Software] {
        return self.softwareList
    }
}
