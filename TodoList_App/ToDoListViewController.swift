import UIKit
import CoreData

class ToDoListViewController: UITableViewController,ToDoAppDelegate{

    var todoItems = [ToDoTask]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchAllItems()
     
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todotask = tableView.dequeueReusableCell(withIdentifier: "todoitem", for: indexPath) as! cellTableViewController
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        todotask.taskitem.text = todoItems[indexPath.row].task!
        todotask.dateitem.text = dateFormatter.string(from: todoItems[indexPath.row].date!)
        todotask.notesitem.text = todoItems[indexPath.row].note!
        return todotask
}
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoTask")
        do{
            let result = try managedObjectContext.fetch(request)
            todoItems = result as! [ToDoTask]
        }catch{
            print("hi \(error)")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemViewController = navigationController.topViewController as! AddItemViewController
        addItemViewController.delegate = self
    }
    func addItemButtonPressed(by controller: AddItemViewController, title: String, note: String, date: Date) {
        let taskItem = NSEntityDescription.insertNewObject(forEntityName: "ToDoTask", into: managedObjectContext) as! ToDoTask
        taskItem.task = title
        taskItem.note = note
        taskItem.date = date
        taskItem.isChecked = false
        todoItems.append(taskItem)
        tableView.reloadData()
        saveContext()
        dismiss(animated: true, completion: nil)
    }
    

    func cancelButtonPressed(by controller: UIViewController) {
          dismiss(animated: true, completion: nil)
      }
}

