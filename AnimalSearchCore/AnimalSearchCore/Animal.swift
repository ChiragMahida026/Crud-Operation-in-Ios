//
//  Animal.swift
//  AnimalSearchCore
//
//  Created by bmiit on 12/04/22.
//

import CoreData
@objc(Animal)
class Animal :NSManagedObject
{
    @NSManaged var id : NSNumber!
    @NSManaged var animalname : String!
    @NSManaged  var desc : String!
    @NSManaged  var deletedData : Date?
    
    
}
