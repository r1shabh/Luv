//
//  UserProfile.swift
//  Luv
//
//  Created by Rishabh Anand on 11/19/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import SwiftUI

public struct UserProfile: Hashable, Codable, Identifiable {
    public var id: UUID
    var name: String
    var contactInfo: String
    var surveyScore: Double
    var description: String
    var birthday: String
}
/*
 {
     "id": "FC991AC2-CD4F-4A8B-96E3-89363CE55CF2",
     "name": "John Doe",
     "contactInfo": "",
     "surveyScore": 95.5,
     "description": "",
     "birthday": "1992-10-04"
 }
 */
