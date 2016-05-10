//
//  TimeLine+CoreDataProperties.swift
//  Project20
//
//  Created by 西邮帅哥 on 16/4/25.
//  Copyright © 2016年 xiyoushuaige. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TimeLine {

    @NSManaged var image: NSData?
    @NSManaged var date: String?
    @NSManaged var text: String?
    @NSManaged var address: String?

}
