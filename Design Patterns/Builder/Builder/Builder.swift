//
//  Builder.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 23/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

class Builder {
    func main() -> Void {
        let builder = HTMLBuilder(name: "ul")
        builder.addChild(name: "li", text: "hello")
        builder.addChild(name: "li", text: "world")
        print(builder.description)
    }
}

/**
 Building Block used by Builder to construct.
 */
class HTMLElement: CustomStringConvertible {
    var name: String
    var text: String?
    var elements: [HTMLElement] = [HTMLElement]()
    private let indentSize = 2
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    private func description(indent: Int) -> String {
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        if let text = text {
            if text.count > 0 {
                result += String(repeating: " ", count: indent + 1)
                result += "\(text)\n"
            }
        }
        for element in elements {
            result += element.description(indent: indent + 1)
        }
        result += "\(i)</\(name)>\n"
        return result
    }
    
    public var description: String {
        return description(indent: 0)
    }
}


class HTMLBuilder: CustomStringConvertible {
    private let rootName: String
    var root: HTMLElement
    init(name: String) {
        self.rootName = name
        root = HTMLElement(name: name)
    }
    
    func addChild(name: String, text: String) {
        let e = HTMLElement(name: name, text: text)
        root.elements.append(e)
    }
    public var description: String {
        return root.description
    }
    
    func clear() -> Void {
        root = HTMLElement(name: rootName, text: "")
    }
}

