import UIKit

class ItemDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var item: Item? {
        didSet {
            configureView()
        }
    }
    
    // UI Elements
    private let itemNameLabel = UILabel()
    private let expirationDateLabel = UILabel()
    private let editButton = UIButton(type: .system)
    private let deleteButton = UIButton(type: .system)
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureView()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Item Details"
        
        // Set up the item name label
        itemNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemNameLabel)
        
        // Set up the expiration date label
        expirationDateLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        expirationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expirationDateLabel)
        
        // Set up the edit button
        editButton.setTitle("Edit Item", for: .normal)
        editButton.addTarget(self, action: #selector(editItem), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        // Set up the delete button
        deleteButton.setTitle("Delete Item", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            itemNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            itemNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            expirationDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            expirationDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expirationDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            editButton.topAnchor.constraint(equalTo: expirationDateLabel.bottomAnchor, constant: 40),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Configure View
    
    private func configureView() {
        guard let item = item else { return }
        
        itemNameLabel.text = item.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        expirationDateLabel.text = "Expired on: \(dateFormatter.string(from: item.expirationDate))"
    }
    
    // MARK: - Actions
    
    @objc private func editItem() {
        // Handle edit item action
        // This could involve presenting an edit form or pushing a new view controller
        print("Edit item tapped")
    }
    
    @objc private func deleteItem() {
        // Handle delete item action
        // This might involve showing a confirmation alert and then deleting the item
    }
}
