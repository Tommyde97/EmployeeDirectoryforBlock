//
//  ViewController.swift
//  Employee Directory for Block
//
//  Created by Tommy De Andrade on 2/17/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var employees: EmployeeList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.employees.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = employees?.employees[indexPath.row].full_name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployeeViewController {
            destination.employee = employees?.employees[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
        //let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")
        //let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")
        URLSession.shared.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let JSONdata = try decoder.decode(EmployeeList.self, from: data!)
                    print(JSONdata)
                    self.employees = JSONdata
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                                    
                } catch {
                    
                    print(error)
                    
                    }
                
                }
            
            }.resume()
        
        }
    
    }


