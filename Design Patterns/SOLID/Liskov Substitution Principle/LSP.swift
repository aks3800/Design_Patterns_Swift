//
//  LSP.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 20/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation


class LSP {
    
    func setAndMeasure(rc: Rectangle) {
        rc.width = 3
        rc.height = 4
        print("Expected area to be 12 but got \(rc.area)")
    }
    func main() {
        let rc = Rectangle()
        setAndMeasure(rc: rc)
        
        let sq = Square()
        setAndMeasure(rc: sq)
    }
}



class Rectangle: CustomStringConvertible {
    
    var _width = 0
    var _height = 0
    
    var width : Int {
        get {
            return _width
        }
        set(value) {
            _width = value
        }
    }
    
    var height : Int {
        get {
            return _height
        }
        set(value) {
            _height = value
        }
    }
    
    init() {
        
    }
    
    init(width: Int, height: Int) {
        _width = width
        _height = height
    }
    
    var area: Int {
        return width * height
    }
    
    var description: String {
        return "Width: \(width) Height: \(height)"
    }
    
}


// Will violate the LSP.
class Square: Rectangle {
    
    override var width: Int {
        get {
            return _width
        }
        set(value) {
            _width = value
            _height = value
        }
    }
    override var height: Int {
        get {
            return _height
        }
        set(value) {
            _width = value
            _height = value
        }
    }
}

