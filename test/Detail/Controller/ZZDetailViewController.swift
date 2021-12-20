//
//  ZZDetailViewController.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit
import YogaKit
import SwiftyJSON

private let cellID = "ZZDetailTableViewCell"

enum Country {
    case Singapore
    case Thailand
}

class ZZDetailViewController: UIViewController {

    lazy var headView = ZZDetailTableViewHeader()
    lazy var footView = ZZDetailTableViewFooter()
    lazy var tableView: UITableView = UITableView.init(frame: .zero, style: .plain)
    lazy var model: ZZDetailControllerModel = ZZDetailControllerModel()
    /// 创建详情控制器
    /// - Parameter country: 国家枚举类型
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ui()
        model.network.subscribe { data in
            ZZLog(data)
        } onError: { err in
            print((err as? ApiError)?.message ?? err)
        }.disposed(by: zz_disposeBag)

    }
    
    func ui(){
        root.ZZYogaLayout {
            $0.alignItems = .stretch
            $0.paddingHorizontal = YGValue(36)
        }
        
        tableView.mutate { t in
            t.separatorStyle = .none
            t.delegate = self
            t.dataSource = self
            t.showsVerticalScrollIndicator = false
            t.register(UINib.init(nibName: "ZZDetailTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
            t.tableHeaderView = headView
            t.tableFooterView = footView
        }
        tableView.ZZYogaLayout {
            $0.flex = 1
        }
        
        root.addSubview(tableView)
        root.yoga.applyLayout(preservingOrigin: true)
    }
}

extension ZZDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ZZDetailTableViewCell
        cell.divider.isHidden = indexPath.row == tableView.numberOfRows(inSection: 0) - 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ZZDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath) click")
    }
}
