import UIKit

class AddItemViewController: UIViewController {
    weak var delegate: ToDoAppDelegate?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func addItemButton(_ sender: UIButton) {
        delegate?.addItemButtonPressed(by: self, title: titleTextField.text!, note: notsTextField.text!, date: datePicker.date)
    }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
