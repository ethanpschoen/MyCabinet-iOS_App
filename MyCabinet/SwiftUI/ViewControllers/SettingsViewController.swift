import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var notificationsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        
        // Load settings (e.g., from UserDefaults)
        notificationsSwitch.isOn = UserDefaults.standard.bool(forKey: "notificationsEnabled")
    }
    
    @IBAction func notificationsSwitchToggled(_ sender: UISwitch) {
        // Save the setting
        UserDefaults.standard.set(sender.isOn, forKey: "notificationsEnabled")
        
        // Update notifications settings in the app
        if sender.isOn {
            // Enable notifications
        } else {
            // Disable notifications
        }
    }
}
