//
//  SoftwareManager.swift
//  KeyExtractor
//
//  Created by remy on 28/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class SoftwareManager {
    
    /*private let pathListFile: String
    
    
    func test()-> Software{
    
        var pathWithoutNameFile: String
        var namefile: String
        var extensionFile: String
    
        
        let file: File?
        file = FileFactory.createFile(pathWithoutNameFile, name: namefile, ext: extensionFile)
    
        let key = file?.findValue("sequence")
    }
    */
    
    static func loadDictionary(fileName: String, dictionary: NSDictionary<string, Software>) -> NSDictionary<string, Software>
    {
        foreach (String s in ways){
            if (s.Trim().StartsWith("//"))
                continue; // Skip commented lines
    
                String[] d = s.Split(';');
                if (d.Length >= 5){
                    int registryRoot = int.Parse(d[0]); // TODO : implement logic to read in different registry root (0 is HKEY LOCAL MACHINE)
                    String softwareName = d[1];
    String version = d[2];
    String registryPath = d[3];
    String registryValue = d[4];
    String registryLicenceUsernamePath = d.Length >= 6 ? d[5] : "";    // TODO : implement this LATER
    String registryLicenceUsernameValue = d.Length >= 7 ? d[6] : "";    // TODO : implement this LATER
    
    
    String softwareIdentifier = softwareName + " - " + version;
    
    Software software = new Software(softwareIdentifier, softwareName, "", "", version, registryRoot, registryPath, registryValue, registryLicenceUsernamePath, registryLicenceUsernameValue);
    
    //  PathValue p = new PathValue(registryPath, registryValue);
    //La namedValue a pour nom le logiciel, et pour value la version.
    
    Logger.Log("Ways", "Found new signature " + softwareIdentifier);
    Logger.Log("Ways", "==> Path " + registryPath);
    Logger.Log("Ways", "==> Value " + softwareIdentifier);
    dictionary.Add(softwareIdentifier, software);
    }
}
Logger.Log("Ways", "Found " + dictionary.Keys.Count + " signature(s)");

return dictionary;
}

}
