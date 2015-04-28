//
//  SoftwareKey.swift
//  KeyExtractor
//
//  Created by polytech on 23/04/2015.
//  Copyright (c) 2015 polytech-RE. All rights reserved.
//

import Foundation

/*  
    Classe representant les cles licences ponderees,
    avec une valeur et un poids.
    Ce poids est affecte en fonction de la forme de 
    la cle.
*/

class SoftwareKey: NSObject{
    
    /*  
        The key Value
        (for example: AAAA-AAAA-AAAA-AAAA)
    */
    private let key: String
    
    /*
        The key weight,
        the more weight is great
        the more chance that it is a real key.
    */
    private let weight: Int
    
    init (key: String, weight: Int){
        self.key = key
        self.weight = weight
    }
}