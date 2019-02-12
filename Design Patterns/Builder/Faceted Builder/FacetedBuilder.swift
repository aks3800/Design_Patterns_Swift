//
//  FacetedBuilder.swift
//  Design Patterns
//
//  Created by aks on 12/02/19.
//  Copyright © 2019 aks. All rights reserved.
//

import Foundation


class Employee : CustomStringConvertible {
    // Adderess
    var streetAddress = "", city = ""
    
    // Employment
    var companyName = "", role = ""
    
    var description: String {
        return "I live at \(streetAddress), \(city) and work in \(companyName) as \(role)"
    }
}

class EmployeeBuilder {
    var employee = Employee()
    var lives: EmployeeAddressBuilder {
        return EmployeeAddressBuilder(emp: employee)
    }
    var works: EmployeeJobBuilder {
        return EmployeeJobBuilder(emp: employee)
    }
    func build() -> Employee {
        return employee
    }
}


class EmployeeAddressBuilder: EmployeeBuilder {
    internal  init(emp: Employee) {
        super.init()
        self.employee = emp
    }
    
    func at(streetAddress: String) -> EmployeeAddressBuilder {
        employee.streetAddress = streetAddress
        return self
    }
    
    func inCity(city: String) -> EmployeeAddressBuilder {
        employee.city = city
        return self
    }
}

class EmployeeJobBuilder: EmployeeBuilder {
    internal init(emp: Employee) {
        super.init()
        self.employee = emp
    }
    
    func inCompany(companyName: String) -> EmployeeJobBuilder {
        employee.companyName = companyName
        return self
    }
    
    func roleAs(role: String) -> EmployeeJobBuilder {
        employee.role = role
        return self
    }
}

class FacetedBuilder {
    func main() -> Void {
        let empBuilder = EmployeeBuilder()
        let emp = empBuilder
            .lives.at(streetAddress: "34, AkashNeemMarg").inCity(city: "Gurgaon")
            .works.inCompany(companyName: "Jabong").roleAs(role: "Software Developer")
            .build()
        print(emp)
    }
}
