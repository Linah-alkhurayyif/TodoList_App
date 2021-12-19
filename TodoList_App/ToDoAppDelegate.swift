import UIKit
protocol ToDoAppDelegate: AnyObject {
    func addItemButtonPressed(by controller: AddItemViewController, title: String, note: String, date: Date)
    func cancelButtonPressed(by controller: UIViewController)
}
