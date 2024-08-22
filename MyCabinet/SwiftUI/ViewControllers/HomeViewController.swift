import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Load sections (you'll likely load these from Core Data or your persistence service)
        sections = loadSections()
    }
    
    func loadSections() -> [Section] {
        // Placeholder function for loading sections
        // Replace with actual data loading logic
        return [
            Section(title: "Dairy", iconName: "Dairy"),
            Section(title: "Product", iconName: "Product")
        ]
    }
    
    // MARK: - TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle selection and navigate to SectionDetailViewController
        let selectedSection = sections[indexPath.row]
        let detailVC = SectionDetailViewController()
        detailVC.section = selectedSection
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
