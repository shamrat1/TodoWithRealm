//
//  Todo.swift
//  TodoWithRealm
//
//  Created by Yasin Shamrat on 1/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Todo: Object {
    dynamic var id = Int()
    dynamic var item : String?
    dynamic var isCompleted : String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
