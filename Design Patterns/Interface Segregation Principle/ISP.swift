//
//  ISP.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 21/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation


class ISP {
    func main() -> Void {
        
    }
}

/**
 Document is a simple class which has its functionalities.
 */
class Document {
    
}

/**
 A general machine performs following functionalites: Printing, Scanning and Faxing.
 */
protocol Machine {
    func print(d: Document)
    func scan(d: Document)
    func fax(d: Document)
}

/**
 Let say, company has a brand new latest tech machine which can perform all functionalities.
 Therefore, It can easily adhere to Machine protocol.
 */

class LatestTechMachine: Machine {
    func print(d: Document) {
        // Print Functionality
    }
    
    func scan(d: Document) {
        // Scan Functionality
    }
    
    func fax(d: Document) {
        // Fax Functionality
    }
}


/**
 Old machine can only perform printing. Therefore adhering to Machine protocol creates a problem.
 */
class OldMachine: Machine {
    func print(d: Document) {
        // Print Functionality
    }
    
    func scan(d: Document) {
        // Can't
    }
    
    func fax(d: Document) {
        // Can't
    }
}

// Here Interface Segregation Principle comes into picture by making protocols for each functionality


protocol Print {
    func print(d: Document)
}

protocol Scan {
    func scan(d: Document)
}

protocol Fax {
    func fax(d: Document)
}

/**
 Ordinary Printer needs to only adhere to Print protocol as it only can perform printing.
 */
class OrdinaryPrinter: Print {
    func print(d: Document) {
        // Print Functionality
    }
}

