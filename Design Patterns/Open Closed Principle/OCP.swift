//
//  OCP.swift
//  Design Patterns
//
//  Created by Akshat Sharma on 19/01/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation

enum Color {
    case red
    case green
    case blue
}

enum Size {
    case small
    case medium
    case large
    case huge
}

class OCP {
    func main() -> Void {
        let apple = Product("apple", Color.green, Size.small)
        let tree = Product("tree", Color.green, Size.large)
        let house = Product("house", Color.blue, Size.large)
        
        let products = [apple, tree, house]
        
        let pf = ProductFilter()
        for filteredProduct in pf.filterByColor(products, Color.green) {
            print("\(filteredProduct.name) is green in color")
        }
        
        let betterFilter = BetterFilter()
        print("Green Products")
        for product in betterFilter.filter(products, ColorSpecification(Color.green)) {
            print("\(product.name) is green in color")
        }
        
        print("Large and Green Products")
        for product in betterFilter.filter(products, AndSpecification(first: ColorSpecification(Color.green), second: SizeSpecification(Size.large))) {
            print("\(product.name) is large green in color")
        }
        
    }
}


/**
 Website selling different Products
 */
class Product {
    
    var name: String
    var color : Color
    var size : Size
    
    init(_ name: String, _ color: Color, _ size: Size) {
        self.name = name
        self.color = color
        self.size = size
    }
}

/*
 Every time new filter to be added we add new function and break OCP.
 */
/**
 Bussiness Requirement to filter Products.
 */
class ProductFilter {
    func filterByColor(_ products: [Product], _ color: Color) -> [Product] {
        return products.filter({ (product) -> Bool in
            return product.color == color
        })
    }
}

//MARK:- Specification
// Elegent approach

/*
 Open for Extension by the virtue of InHeritance but also closed for modification
 */

protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
        where Spec.T == T;
}

class ColorSpecification: Specification {
    typealias T = Product
    let color : Color
    init(_ color: Color) {
        self.color = color
    }
    func isSatisfied(_ item: Product) -> Bool {
        return item.color == color
    }
}

class SizeSpecification: Specification {
    typealias T = Product
    let size : Size
    init(_ size: Size) {
        self.size = size
    }
    func isSatisfied(_ item: Product) -> Bool {
        return item.size == size
    }
}

class AndSpecification<T, SpecA: Specification, SpecB: Specification>: Specification where  SpecA.T == T, SpecB.T == T {
    
    let first: SpecA
    let second: SpecB
    
    init(first: SpecA, second: SpecB) {
        self.first = first
        self.second = second
    }
    
    func isSatisfied(_ item: T) -> Bool {
        return first.isSatisfied(item) && second.isSatisfied(item)
    }
    
    
}

class BetterFilter: Filter {
    typealias T = Product
    func filter<Spec>(_ items: [Product], _ spec: Spec) -> [Product] where Spec : Specification, BetterFilter.T == Spec.T {
        return items.filter({ (item) -> Bool in
            return spec.isSatisfied(item)
        })
    }
}
