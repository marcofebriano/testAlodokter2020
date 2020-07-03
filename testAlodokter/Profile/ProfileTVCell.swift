//
//  ProfileTVCell.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import Foundation
import UIKit
import CoreData

open class ProfileTVCell: UITableViewCell {
    
    private lazy var card: UIView = .init()
    private lazy var profileImage: UIImageView = .init()
    private lazy var nameLbl: UILabel = .init()
    private lazy var genderLbl: UILabel = .init()
    private lazy var phoneLbl: UILabel = .init()
    private lazy var stackView: UIStackView = .init()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setBaseView()
        isSelected = false
    }
    
    public func setView(data: NSManagedObject) {
        guard let imageData = data.value(forKey: "image") as? Data,
            let name = data.value(forKey: "name") as? String,
            let phoneNumber = data.value(forKey: "phoneNumber") as? String,
            let gender = data.value(forKey: "gender") as? String
        else { return }
        
        let image = UIImage(data: imageData)
        profileImage.image = image
        nameLbl.text = name
        genderLbl.text = gender
        phoneLbl.text = phoneNumber
    }
    
    private func setLayout() {
        self.contentView.addSubview(card)
        self.card.addSubview(profileImage)
        self.card.addSubview(stackView)
        
        card.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.topMargin)
            make.bottom.equalTo(self.contentView.snp.bottomMargin)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(100)
            make.height.equalTo(profileImage.snp.width)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalTo(profileImage.snp.right).offset(8)
            make.right.equalToSuperview().inset(8)
            make.centerY.equalTo(profileImage)
        }
        
        stackView.addArrangedSubview(nameLbl)
        stackView.addArrangedSubview(genderLbl)
        stackView.addArrangedSubview(phoneLbl)
    }
    
    private func setBaseView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        
        card.layer.borderColor = UIColor.black.cgColor
        card.layer.borderWidth = 1
    }
    
    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = .white
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
