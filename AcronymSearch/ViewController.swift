//
//  ViewController.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textfield: UITextField!
  
    private var viewmodel = AcronymListViewModel()

    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        textfield.returnKeyType = .done
        textfield.autocapitalizationType = .words
        textfield.autocorrectionType = .no
        textfield.becomeFirstResponder()
        
  
       
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data:[Acronym] = viewmodel.acronyms.value!
        
        if data.count != 0{
            
            return data[0].longForms.count
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acronymcell", for: indexPath) as? AcronymCell
       
        let data:[Acronym] = viewmodel.acronyms.value!
        
        if(data.count > 0){
            cell?.longformLbl.text = data[0].longForms[indexPath.row].lf
            cell?.freqLbl.text = String(data[0].longForms[indexPath.row].frequency!)
            cell?.yearLbl.text = String(data[0].longForms[indexPath.row].since!)
        }

        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}


extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let abb = textField.text{
            
            viewmodel.fetchData(abb: abb)
            
            viewmodel.acronyms.bind {[weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        return true
    }
    
}

