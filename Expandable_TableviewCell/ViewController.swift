//
//  ViewController.swift
//  Expandable_TableviewCell
//
//  Created by Md Sifat on 30/9/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data = [Data(headerName: "Men", subHeaderName: ["Pants", "Sunglass","Panjabi"], isExpand: true), Data(headerName: "Kids", subHeaderName: ["Diaper", "Soap","Cloth", "Toys"], isExpand: true), Data(headerName: "Women", subHeaderName: ["Sari", "3 Pices","Shoes"], isExpand: true)]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame:CGRect(x: 10, y: 10, width: tableView.frame.size.width - 20, height: 40))
        headerView.delegate = self
        headerView.Indx = section
        headerView.button.setTitle(data[section].headerName, for: .normal)
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpand{
            return data[section].subHeaderName.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section].subHeaderName[indexPath.row]
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.section].isExpand{
            return 30
        }else{
            return 0
        }
    }
    
    
}

extension ViewController: headerDelegate{
    func callHeader(index: Int) {
        data[index].isExpand = !data[index].isExpand
        tableView.reloadSections([index], with: .automatic)
    }
    
    
}

