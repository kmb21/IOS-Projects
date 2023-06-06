//
//  Post.swift
//  C-Tour
//
//  Created by Salma Aly on 4/15/23.
//

import Foundation
import ParseSwift

// Create ParseObject to store posts (not sure if this is necessary)
struct Post: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var caption: String?
    var user: User?
    var imageFile: ParseFile?
}
