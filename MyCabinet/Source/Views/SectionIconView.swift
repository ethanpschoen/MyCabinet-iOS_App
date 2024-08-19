import UIKit

// This is a custom UIView subclass for displaying sections as icons
class SectionIconView: UIView {
    
    private var sections: [Section] = []
    
    // UI Components
    private let collectionView: UICollectionView
    
    // Initializer
    override init(frame: CGRect) {
        // Layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 120) // Adjust item size as needed
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: frame)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup Collection View
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SectionIconCell.self, forCellWithReuseIdentifier: "SectionIconCell")
        addSubview(collectionView)
        
        // Layout constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    // Update the view with new sections
    func updateSections(_ sections: [Section]) {
        self.sections = sections
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SectionIconView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionIconCell", for: indexPath) as! SectionIconCell
        let section = sections[indexPath.item]
        cell.configure(with: section)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle section selection
        let selectedSection = sections[indexPath.item]
        print("Selected Section: \(selectedSection.title)")
        // Navigate to section details or trigger delegate method
    }
}
