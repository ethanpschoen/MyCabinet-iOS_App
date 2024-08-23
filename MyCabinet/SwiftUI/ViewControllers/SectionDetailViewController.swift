import UIKit

class SectionDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var section: Section!
    var items: NSSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = section.title
        
        // Load items for the section
        items = section.items
    }
    
    // MARK: - TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        // Convert NSSet to an Array of Items and sort or handle it
        if let itemArray = items.allObjects as? [Item] {
            // Check if indexPath.row is within bounds
            guard indexPath.row >= 0 && indexPath.row < itemArray.count else {
                print("Index out of bounds")
                return cell
            }
            
            // Safely access the item and set the cell's text label
            let item = itemArray[indexPath.row]
            cell.textLabel?.text = item.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Convert NSSet to Array of Items
        if let itemArray = items.allObjects as? [Item] {
            // Check if indexPath.row is within bounds
            guard indexPath.row >= 0 && indexPath.row < itemArray.count else {
                print("Index out of bounds")
                return
            }
            
            // Safely access the selected item and navigate to ItemFormViewController
            let selectedItem = itemArray[indexPath.row]
            let formVC = ItemFormViewController()
            formVC.item = selectedItem
            navigationController?.pushViewController(formVC, animated: true)
        }
    }
}
