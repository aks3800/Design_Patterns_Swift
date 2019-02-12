//
//  File.swift
//  Design Patterns
//
//  Created by aks on 12/02/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

extension HTMLBuilder {
    func addChildFluent(name: String, text: String) -> HTMLBuilder {
        let e = HTMLElement(name: name, text: text)
        root.elements.append(e)
        return self
    }
}


