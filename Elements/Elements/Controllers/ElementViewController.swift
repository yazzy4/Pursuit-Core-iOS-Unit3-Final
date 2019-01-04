//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var elements = [Element]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }



}
extension ElementViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)
        let element = elements[indexPath.row]
        cell.textLabel?.text = element.name
        cell.detailTextLabel?.text = String(element.number)
        return cell
    }
}
