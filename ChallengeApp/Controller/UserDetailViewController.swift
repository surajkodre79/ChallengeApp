//
//  UserDetailViewController.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import UIKit
import Foundation
import ProgressHUD
import SnapKit

class UserDetailViewController: UIViewController {
    
    var userInfo: UserData!
    var safeArea: UILayoutGuide!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        safeArea = view.layoutMarginsGuide
        setInformation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setInformation() {
        idText.text = userInfo.id ?? emptyString
        typeText.text = userInfo.type ?? emptyString
        dateText.text = userInfo.date ?? emptyString
        errorMessageLabel.text = emptyString
        setDataInformation()
    }
    
    private func setDataInformation() {
        if userInfo.type == "text" {
            dataText.text = userInfo.data ?? emptyString
        } else {
            setImage()
        }
    }
    
    private func setImage() {
        ProgressHUD.show(loadingImageMessage)
        let url = URL(string: userInfo.data ?? emptyString)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                ProgressHUD.dismiss()
                if let imageData = data {
                    self.imageData.image = UIImage(data: imageData)
                } else {
                    self.imageData.image = nil
                    self.errorMessageLabel.text = errorMessage
                }
            }
        }
    }
    
    func setupView() {
        self.view.addSubview(detailView)
        detailView.addSubview(idLable)
        detailView.addSubview(idText)
        detailView.addSubview(typeLable)
        detailView.addSubview(typeText)
        detailView.addSubview(dateLable)
        detailView.addSubview(dateText)
        detailView.addSubview(dataLable)
        detailView.addSubview(dataText)
        detailView.addSubview(imageData)
        detailView.addSubview(errorMessageLabel)
        self.setView()
    }
    
    func setView(){
        detailView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view).offset(60)
        }
        
        idLable.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(detailView).offset(20)
            make.width.equalTo(70)
        }
        
        idText.snp_makeConstraints { (make) in
            make.left.equalTo(idLable.snp_rightMargin).offset(20)
            make.top.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
        }
        
        typeLable.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(idLable.snp_bottomMargin).offset(20)
            make.width.equalTo(70)
        }
        
        typeText.snp_makeConstraints { (make) in
            make.left.equalTo(typeLable.snp_rightMargin).offset(20)
            make.top.equalTo(idText.snp_bottomMargin).offset(20)
            make.right.equalTo(detailView).offset(-20)
        }
        
        dateLable.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(typeLable.snp_bottomMargin).offset(20)
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
        }
        
        imageData.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(dataLable.snp_bottomMargin).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.bottom.equalTo(detailView).offset(-20)
        }
        
        errorMessageLabel.snp_makeConstraints { (make) in
            make.left.equalTo(detailView).offset(20)
            make.top.equalTo(dataLable.snp_bottomMargin).offset(50)
            make.right.equalTo(detailView).offset(-20)
        }
    }
    
    let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let idLable: UILabel = {
        let label = UILabel()
        label.text = "Id:-"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLable: UILabel = {
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
    
    let idText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        return label
    }()
    
    let typeText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let dateText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        return label
    }()
    
    let imageData: UIImageView = {
        let imagView = UIImageView()
        return imagView
    }()
    
    let errorMessageLabel: UILabel = {
       let label = UILabel()
       label.textColor = UIColor.red
        label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = .zero
       return label
    }()
}
