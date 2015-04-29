//
//  Software.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

class Software {
    
    private var name : String
    private var vendor : String
    private var InstallLocation: String
    private var version : String
    
    //private var keys: Set<SoftwareKey> //Set<SoftwareKey>
    
    /*
    The licence key (ex 'AAA-BBBB-CCCCC-EEEEE')
    */
    private var key : String
    
    /*
    Registry path of the licence key
    */
    private var keyRegistryPath: String
    
    /*
    Registry value which contains the licence key (ex 'ProductID')
    */
    private var keyRegistryValue: String
    
    private var userName: String
    
    init(name: String, vendor: String, version: String, computerName: String, userName: String, key: String, keyRegistryPath: String, keyRegistryValue: String) {
        self.name = name
        self.vendor = vendor
        self.version = version
        self.userName = userName
        self.key = key
        self.keyRegistryPath = keyRegistryPath
        self.keyRegistryValue = keyRegistryValue
        //self.keys = Set()
        self.InstallLocation = String()
    }
    
    /**
    * Return true if and only if at least one key is associated to the soft
    */
    func HasKey() -> Bool {
        //return !keys.isEmpty
        return true
    }
    /*
    /**
    * Return the key to be used (with the maximum weight)
    */
    func GetSoftwareKey() -> SoftwareKey?{
        if (!keys.isEmpty){
            var bestSoftwareKey: SoftwareKey
            var maxValue: Int
            maxValue = 0
            
            for index in 1...keys.count{
                keys.
                if(keys.valueForKey(index).weight > maxValue){
                    bestSoftwareKey = keys.valueForKey(index)
                    maxValue = bestSoftwareKey.weight
                }
            }
            return bestSoftwareKey
        }
        return nil
    }
    /*
    //Méthode qui sert lors de la vérification de si on insère ou non une clé
    public bool HasFoundKey(){
        if (Keys != null){
            foreach (SoftwareKey k in Keys){
                if (k.Weight >= 100){
                    return true;
                }
            }
        }
        return false;
    }
    //Fonction qui permet de supprimer les clés déjà stockées.s
    public void ResetKeys(){
        Keys = new List<SoftwareKey>();
    }
*/*/
}