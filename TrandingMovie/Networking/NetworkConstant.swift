//
//  NetworkConstant.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    public var apiKey: String {
        get {
            "90c9174a2889a3d107e7ad700a2a3d38"
        }
    }
    
    public var serverAddress: String {
        get {
            "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            "https://image.tmdb.org/t/p/w500/"
        }
    }
}
