//
//  Item+CoreDataProperties.swift
//  
//
//  Created by Pooja on 3/14/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var checked: Bool
    @NSManaged public var title: String?
    @NSManaged public var parentCategory: Category?

}
