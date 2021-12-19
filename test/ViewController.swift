//
//  ViewController.swift
//  test
//
//  Created by Max on 2021/12/19.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type: Country = indexPath.row == 0 ? .Singapore : .Thailand
        self.navigationController?.pushViewController(ZZDetailViewController.init(country:type ), animated: true)
    }
}

