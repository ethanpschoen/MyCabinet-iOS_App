import UIKit

class ItemRowViewController: UIViewController {
    
    // MARK: - Properties
    
    var item: Item? {
        didSet {
            configureView()
        }
    }
    
    // UI Elements
    private let itemNameLabel = UILabel()
    private let expirationStatusLabel = UILabel()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureView()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Set up the item name label
        itemNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemNameLabel)
        
        // Set up the expiration status label
        expirationStatusLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        expirationStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expirationStatusLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            itemNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            itemNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            itemNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            expirationStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expirationStatusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            expirationStatusLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    // MARK: - Configure View
    
    private func configureView() {
        guard let item = item else { return }
        
        itemNameLabel.text = item.name
        
        if item.isExpired {
            expirationStatusLabel.text = "Expired"
            expirationStatusLabel.textColor = .red
        } else if let daysLeft = item.daysUntilExpiration {
            expirationStatusLabel.text = "\(daysLeft) days left"
            expirationStatusLabel.textColor = .green
        } else {
            expirationStatusLabel.text = "Expiration date unknown"
            expirationStatusLabel.textColor = .gray
        }
    }
    
    // MARK: - Public Methods
    
    func setItem(_ item: Item) {
        self.item = item
    }
}
