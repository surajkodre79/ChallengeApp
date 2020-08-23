//
//  UserListTableViewCell.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation
import UIKit

class UserListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    var cellData: UserData? {
        didSet {
            guard let data = cellData else { return }
            self.iDText.text = data.id
            self.typeText.text = data.type
            self.dateText.text = data.date
            self.dataText.text = data.data
        }
    }
    
    func setupView() {
        addSubview(detailView)
        detailView.addSubview(idLabel)
        detailView.addSubview(iDText)
        detailView.addSubview(typeLabel)
        detailView.addSubview(typeText)
        detailView.addSubview(dateLable)
        detailView.addSubview(dateText)
        detailView.addSubview(dataLable)
        detailView.addSubview(dataText)
        self.selectionStyle = .none
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        
        detailView.snp_makeConstraints { (make) in
            make.top.left.equalTo(self).offset(20)
            make.right.bottom.equalTo(self).offset(-20)
        }

        idLabel.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(detailView).offset(20)
            make.width.equalTo(70)
        }

        iDText.snp_makeConstraints { (make) in
            make.left.equalTo(idLabel.snp_rightMargin).offset(20)
            make.top.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
        }

        typeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(idLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(70)
        }

        typeText.snp_makeConstraints { (make) in
            make.left.equalTo(typeLabel.snp_rightMargin).offset(20)
            make.top.equalTo(iDText.snp_bottomMargin).offset(20)
            make.right.equalTo(detailView).offset(-20)
        }

        dateLable.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(typeLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(70)
        }

        dateText.snp_makeConstraints { (make) in
            make.left.equalTo(dateLable.snp_rightMargin).offset(20)
            make.top.equalTo(typeText.snp_bottomMargin).offset(20)
            make.right.equalTo(detailView).offset(-20)
        }

        dataLable.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(dateLable.snp_bottomMargin).offset(20)
            make.width.equalTo(70)
        }

        dataText.snp_makeConstraints { (make) in
            make.left.equalTo(dataLable.snp_rightMargin).offset(20)
            make.top.equalTo(dateText.snp_bottomMargin).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.bottom.equalTo(detailView).offset(-20)
        }

    }
    
    let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        return view
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "Id:-"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
        
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type:-"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLable: UILabel = {
        let label = UILabel()
        label.text = "Date:-"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataLable: UILabel = {
        let label = UILabel()
        label.text = "Data:-"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iDText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = .zero
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let typeText: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateText: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataText: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
