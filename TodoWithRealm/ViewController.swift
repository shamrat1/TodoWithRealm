//
//  ViewController.swift
//  TodoWithRealm
//
//  Created by Yasin Shamrat on 1/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.prefersLargeTitles = true
            
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
    }

    @IBAction func onClickAddItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Here..."
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            print("Save Clicked.")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "Data \(indexPath.row)"
        cell.textLabel?.textColor = .red
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell!.accessoryType = (cell!.accessoryType == .checkmark ? .none : .checkmark)
    }
    
    
}

