import UIKit

class ItemFormViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var expirationDatePicker: UIDatePicker!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            nameTextField.text = item.name
            expirationDatePicker.date = item.expirationDate
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let item = item {
            // Update existing item
            item.name = nameTextField.text ?? ""
            item.expirationDate = expirationDatePicker.date
        } else {
            // Create new item
            let newItem = Item()
            // Save the item (e.q., to Core Data or your persistence service)
        }
        
        // Navigate back to the previous screen
        navigationController?.popViewController(animated: true)
    }
}
