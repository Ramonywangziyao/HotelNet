//
//  Customers.swift
//  Project_HotelNet
//
//  Created by Ziyao Wang on 7/19/15.
//  Copyright (c) 2015 Ziyao Wang. All rights reserved.
//

import Foundation
import CoreData

class Customers: NSManagedObject {

    @NSManaged var account: String
    @NSManaged var password: String

}
