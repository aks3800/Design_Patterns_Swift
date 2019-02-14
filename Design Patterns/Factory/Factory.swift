//
//  Factory.swift
//  Design Patterns
//
//  Created by aks on 14/02/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

class Factory {
    func main() -> Void {
        let p = Point.createPolar(rho: 1, theta: 2)
        print(p)
    }
}

class Point: CustomStringConvertible {
    let x, y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(rho: Double, theta: Double) {
        self.x = rho * cos(theta)
        self.y = rho * sin(theta)
    }
    
    var description: String {
        return "x = \(x), y = \(y)"
    }
}


/*
 By making use of Factory Methods like done below we can also make init() methods to be private and hide the Point Initialization.
 If we make a seperate class and add below functions, we can make call that Factory class and implement same functionality.
 */

extension Point {
    static func createCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
    static func createPolar(rho: Double, theta: Double) -> Point {
        return Point(rho: rho, theta: theta)
    }
}
