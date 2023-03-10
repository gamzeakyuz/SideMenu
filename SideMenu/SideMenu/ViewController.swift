
import UIKit

class ViewController: UIViewController {

    var titleNames = ["Menu 1","Menu 2","Menu 3","Menu 4","Menu 5","Menu 6"]
    var viewOpen:Bool = true
    
    let SuportSegueIdentifier = "SupportVC"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerTableCells()
        
        self.containerView.isHidden = true
        viewOpen = false
        tableView.backgroundColor = .systemCyan
        tableView.tintColor = .tintColor
        
    }


    func registerTableCells(){
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        containerView.isHidden = false
        tableView.isHidden = false
        
        if !viewOpen {
            viewOpen = true
            containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 808)
            UIView.animate(withDuration: 0.1){
                self.containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
                self.tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 808)
            }
        }else{
            containerView.isHidden = true
            tableView.isHidden = true
            viewOpen = false
            containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 808)
            UIView.animate(withDuration: 0.1){
                self.containerView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
                self.tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 808)
            }
        }
        
    }
    
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
        cell.titleLabel.text = titleNames[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

