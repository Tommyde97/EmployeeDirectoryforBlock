//
//  EmployeeDetails.swift
//  Employee Directory for Block
//
//  Created by Tommy De Andrade on 2/17/22.
//

import Foundation
import UIKit


enum EmployeeType: String, Codable {
    case CONTRACTOR
    case FULL_TIME
    case PART_TIME
    
    func simpleDescription() -> String {
        switch self {
        case .CONTRACTOR:
            return "Contractor"
            
        case .FULL_TIME:
            return "Full Time"
            
        case .PART_TIME:
            return "Part Time"
        }
    }
}

struct EmployeeDetails: Codable {
    let uuid: String
    let full_name: String
    let phone_number: String
    let email_address: String
    let biography: String
    let photo_url_small: String
    let photo_url_large: String
    let team: String
    let employee_type: String
}

struct EmployeeList: Codable {
    let employees: [EmployeeDetails]
}

