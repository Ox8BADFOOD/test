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
import RxSwift
import RxCocoa
import SVProgressHUD

private let cellID = "ZZDetailCell"

enum Country {
    case Singapore
    case Thailand
}

class ZZDetailViewController: UIViewController {

    lazy var headView = ZZDetailTableViewHeader()
    lazy var footView = ZZDetailTableViewFooter()
    lazy var tableView: UITableView = UITableView.init(frame: .zero, style: .plain)
    lazy var model: ZZDetailControllerModel = ZZDetailControllerModel(country: country)
    private(set) var country: Country!
    /// 创建详情控制器
    /// - Parameter country: 国家枚举类型
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ui()
        SVProgressHUD.show()
        model.network.observeOn(MainScheduler.instance).subscribe {[weak self] model in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                SVProgressHUD.dismiss()
            }
            
            ZZLog(model)
            guard let sf = self else {return}
            if let _model = model.data ,model.success?.message.lowercased().contains("success") ?? false{
                //car
                sf.headView.carNameLabel.text = _model.model
                sf.headView.carNoLable.text = _model.carplateNumber

                let leftDay = _model.daysLeft ?? 0
                let totalDay = _model.totalDays
                sf.headView.leftDayLabel.text = "\(leftDay) days left"
                sf.headView.leftDayLabel.yoga.markDirty()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    guard totalDay != 0 else {return}
                    let progress = Float(leftDay)/Float(totalDay)
                    sf.headView.progress.setProgress(progress, animated: true)
                }
                //info
                sf.headView.infoView.kmView.valueLabel.text = "\(_model.mileage ?? 0)"
                sf.headView.infoView.usageView.valueLabel.text = "\(_model.usageDueThisMonth ?? 0)"
                sf.headView.infoView.lastUpdateLabel.text = _model.updatedAtString
                sf.headView.setNeedsLayout()
                
                sf.tableView.reloadData()
            } else {
                SVProgressHUD.showError(withStatus: ApiError.serverInnerError(nil).message)
                SVProgressHUD.dismiss(withDelay: 2)
            }
        } onError: {err in
            guard let error = err as? ApiError else {
//                print(err.localizedDescription)
                SVProgressHUD.showError(withStatus: err.localizedDescription)
                SVProgressHUD.dismiss(withDelay: 2)
                return
            }
//            print(error.message)
            SVProgressHUD.showError(withStatus: error.message)
            SVProgressHUD.dismiss(withDelay: 2)
        }.disposed(by: zz_disposeBag)

    }
    
    func ui(){
        root.ZZYogaLayout {
            $0.alignItems = .stretch
            $0.paddingHorizontal = YGValue(36)
        }
        
        self.footView.customInsuranceBtn.yoga.display = self.country == .Thailand ? .none : .flex
        self.footView.mngSubscriptionView.itemArr.first { itemView in
            itemView.textLable.text == "View Docs"
        }?.yoga.display = self.country == .Thailand ? .none : .flex
        
        self.footView.yoga.markDirty()
        self.footView.setNeedsLayout()
        
        tableView.mutate { t in
            t.separatorStyle = .none
            t.delegate = self
            t.dataSource = self
            t.showsVerticalScrollIndicator = false
            t.register(UINib.init(nibName: "ZZDetailTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
            t.tableHeaderView = headView
            t.tableFooterView = footView
            t.rowHeight = UITableView.automaticDimension
            t.estimatedRowHeight = 50
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
       
        return model.tableTupleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ZZDetailTableViewCell
        cell.divider.isHidden = indexPath.row == tableView.numberOfRows(inSection: 0) - 1
        guard indexPath.row < model.tableTupleArr.count else {return cell}
        let model = model.tableTupleArr[indexPath.row]
        cell.titleLab.text = model.0
        cell.detailLab.text = model.1
        return cell
    }
    
}

extension ZZDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath) click")
    }
}
