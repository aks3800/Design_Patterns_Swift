//
//  SRP.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 19/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

class SRP {
    func main() -> Void {
        let j = Journal()
        let _ = j.addEntry("This is Single Responsiblity")
        let imp = j.addEntry("Very important Stuff")
        
        print(j)
        j.removeEntry(imp)
        print("=====Seperator=====")
        print(j)
    }
}


/**
 1. A class with Single Responsiblity
 2. A single reson to change
 3. SRP states: If a class has any persistance then remove if from the class and write a seperate class for the same which again most importantly follows Single Responsiblity.
 4. Key Term: Seperation of Concerns
 5. Nicer and Maintainable Architecture.
 */
class Journal : CustomStringConvertible {

    // Typical Variables
    var entries = [String]()
    var count = 0
    
    //General Functionalities
    
    func addEntry(_ text: String) -> Int {
        count = count + 1
        entries.append("\(count) : \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) -> Void {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
}
