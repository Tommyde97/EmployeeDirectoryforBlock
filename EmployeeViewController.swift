//
//  EmployeeViewController.swift
//  Employee Directory for Block
//
//  Created by Tommy De Andrade on 2/17/22.
//
import Foundation
import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var full_nameLabel: UILabel!
    @IBOutlet weak var phone_numberLabel: UILabel!
    @IBOutlet weak var email_addressLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var employee_typeLabel: UILabel!
    
    var employee: EmployeeDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uuidLabel.text = employee?.uuid
        full_nameLabel.text = employee?.full_name
        phone_numberLabel.text = employee?.phone_number
        email_addressLabel.text = employee?.email_address
        biographyLabel.text = employee?.biography
        teamLabel.text = employee?.team
        employee_typeLabel.text = employee?.employee_type
        
        let data = NSData(contentsOf: NSURL(string: employee!.photo_url_small)! as URL)
        imageView.image = UIImage(data: data! as Data)
    }
}
