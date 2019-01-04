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
    
    private var refreshControl: UIRefreshControl!

    private var elements = [Element]() {
        didSet {
            DispatchQueue.main.async {
                self.title = "Elements"
                self.tableView.reloadData()
            }
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    fetchElements()
  }
    
    private func refreshElements() {
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchElements), for: .valueChanged)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchElements()
    }

    @objc private func fetchElements() {
        ElementAPIClient.getElements { (appError, elements) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let elements = elements {
                self.elements = elements
                DispatchQueue.main.async {
                    self.refreshControl?.endRefreshing()
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailViewController = segue.destination as?
            ElementDetailViewController else {
                fatalError("indexPath, detailVC nil")
        }
        let element = elements[indexPath.row]
        detailViewController.elements = element
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
        cell.detailTextLabel?.text = String("Symbol: \(element.number) , Atomic Mass: \(element.atomic_mass)")
        return cell
    }
}
    
//    DispatchQueue.global().async {
//    do{
//    let imageData = try Data(contentsOf: movie.artworkUrl100)
//    DispatchQueue.main.async {
//    cell.imageView?.image = UIImage(data: imageData)
//    }
//
//    } catch {
//    print("contents of url error \(error)")
//    }
//    }
//    return cell
//}
//}
