//
//  ViewController.swift
//  AcronymSearch
//
//  Created by Suvidha Nakhawa on 6/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    private var viewmodel = AcronymListViewModel()
    
    let lf:String = "abcd"
    let freq:String = "1"
    let year:String = "1996"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        viewmodel.acronyms.bind {[weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewmodel.fetchData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewmodel.acronyms.value!)
        return viewmodel.acronyms.value?.count ?? 0;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acronymcell", for: indexPath) as? AcronymCell
        cell?.longformLbl.text = lf
        cell?.freqLbl.text = freq
        cell?.yearLbl.text = year
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

