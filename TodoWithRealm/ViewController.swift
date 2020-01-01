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
    var todos : Results<Todo>? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.prefersLargeTitles = true
            
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
       
    }
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        todos = realm.objects(Todo.self)
        self.tableView.reloadData()
    }
    
    @IBAction func onClickAddItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Here..."
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            let todo = Todo()
            todo.id = self.incrementID()
            todo.item = alert.textFields![0].text
            todo.isCompleted = "0"


            let realm = try! Realm()
            do {
                try realm.write {
                    realm.add(todo)
                    print("Saved")
                    self.tableView.reloadData()
                }
            } catch {
                print("Data Can't Be Saved!")
            }
        }))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = todos![indexPath.row].item
        cell.accessoryType = (todos![indexPath.row].isCompleted == "1" ? .checkmark : .none)
        cell.textLabel?.textColor = .red
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        let id = todos![indexPath.row].id
        let item = realm.object(ofType: Todo.self, forPrimaryKey: id)
        print(item)
    }
    func incrementID() -> Int {
        let realm = try! Realm()
        let id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
        return id
    }
    
}

