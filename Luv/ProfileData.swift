//
//  ProfileData.swift
//  Luv
//
//  Created by Rishabh Anand on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import Foundation

var profileMatches = [UserProfile]()

var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

public func readProfileMatches() {
    let profileDataFilename = "ProfileData.json"
    
    let urlOfJsonFileInDocumentDirectory = documentDirectory.appendingPathComponent(profileDataFilename)
    
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
        
        // Video data file exists in the document directory
        profileMatches = loadFromDocumentDirectory(profileDataFilename)
        print("MyMovieData is loaded from document directory")
    } catch {
        
        // Video data file does not exist in the document directory; Load it from the main bundle.
        profileMatches = loadFromMainBundle(profileDataFilename)
        print("MyMovieData is loaded from main bundle")
    }
}


public func loadFromMainBundle<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Unable to find \(filename) in main bundle.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from main bundle:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}

public func loadFromDocumentDirectory<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    // Obtain the URL of the JSON file in the document directory on the user's device
    let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent(filename)
   
    guard let file = urlOfJsonFileInDocumentDirectory
        else {
            fatalError("Unable to find \(filename) in document directory.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from document directory:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}
