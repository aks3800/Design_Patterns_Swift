//
//  DIP.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 21/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

/**
 An Example where a system models the relations of people.
 */
class DIP {
    func main() -> Void {
        let parent = Person(name: "John")
        let child1 = Person(name: "Chris")
        let child2 = Person(name: "Mat")
        
        let relationships = Relationships()
        relationships.addParentAndChild(parent: parent, child: child1)
        relationships.addParentAndChild(parent: parent, child: child2)
        let _ = Research(realationShips: relationships)
        
        let betterRelationships = BetterRelationships()
        betterRelationships.addParentAndChild(parent: parent, child: child1)
        betterRelationships.addParentAndChild(parent: parent, child: child2)
        
        let _ = BetterResearch(browser: betterRelationships)
    }
}

enum Relationship {
    case parent
    case child
    case sibling
}

class Person {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

/**
 A Low Level Module
 */
class Relationships {
    var relations = [(Person, Relationship, Person)]()
    
    func addParentAndChild(parent: Person, child: Person) -> Void {
        relations.append((parent, Relationship.parent, child))
        relations.append((child, Relationship.child, parent))
    }
    
}


/**
 A High Level Module
 It is dependent on Low level module and even more as it dependent on internals of low level module.
 */
class Research {
    init(realationShips: Relationships) {
        let relations = realationShips.relations
        for rel in relations where rel.0.name == "John" && rel.1 == Relationship.parent {
            print("John has a child named \(rel.2.name)")
        }
    }
    
}


//MARK:- Better way to do in accordance of Dependency Inversion Princilple


protocol RelationshipsBrowser {
    func findAllChildrenOf(name: String) -> [Person]
}

/**
 A Low Level Module
 */
class BetterRelationships: RelationshipsBrowser {
    private var relations = [(Person, Relationship, Person)]()
    
    func addParentAndChild(parent: Person, child: Person) -> Void {
        relations.append((parent, Relationship.parent, child))
        relations.append((child, Relationship.child, parent))
    }
    
    func findAllChildrenOf(name: String) -> [Person] {
        return relations.filter({ (relationTupple) -> Bool in
            let (parent, relationship, _) = relationTupple
            return parent.name == name && relationship == Relationship.parent
        }).map({ (relationTupple) -> Person in
            let (_, _, child) = relationTupple
            return child
        })
    }
}


class BetterResearch {
    init(browser: RelationshipsBrowser) {
        for person in browser.findAllChildrenOf(name: "John") {
            print("John has a child with name \(person.name)")
        }
    }
}

