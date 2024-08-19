import UIKit

class SectionIconViewController: UIViewController {
    
    private let sectionIconView = SectionIconView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sectionIconView)
        sectionIconView.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout constraints
        NSLayoutConstraint.activate([
            sectionIconView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sectionIconView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sectionIconView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sectionIconView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Load sections (you'll likely load these from your persistence service
        let sections = loadSections()
        sectionIconView.updateSections(sections)
    }
    
    func loadSections() -> [Section] {
        // Replace with your actual data loading logic
        return [
            Section(title: "Dairy", iconName: "dairyIcon"),
            Section(title: "Dairy", iconName: "produceIcon")
        ]
    }
}
