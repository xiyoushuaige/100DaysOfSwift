//
//  Person.swift
//  Project15
//
//  Created by 西邮帅哥 on 16/4/19.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//

import Foundation

class Person {
    let name: String
    let photo: String
    let mobile: String
    let email: String
    let notes: String
    
    init(name: String, photo: String, mobile: String, email: String, notes: String) {
        self.name = name
        self.photo = photo
        self.mobile = mobile
        self.email = email
        self.notes = notes
    }
    
}