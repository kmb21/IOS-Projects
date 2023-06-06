//
//  College.swift
//  C-Tour
//
//  Created by Salma Aly on 4/15/23.
//

import Foundation
import ParseSwift

// Create a ParseObject to store College objects
struct College: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var name: String?
    var location: String?
    var logo: URL?
}

