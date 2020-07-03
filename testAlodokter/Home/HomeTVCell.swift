//
//  HomeTVCell.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 03/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import UIKit

open class HomeTVCell: UITableViewCell {
    
    public lazy var mainImage: UIImageView = .init()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        isSelected = false
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func setSelected(_ selected: Bool, animated: Bool) {
        contentView.backgroundColor = .white
    }

    private func setLayout() {
        self.contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.topMargin)
            make.bottom.equalTo(self.contentView.snp.bottomMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(mainImage.snp.width)
            make.height.equalTo(mainImage.snp.width)
        }
    }
    public func setImage(image: UIImage?) {
        mainImage.image = image
    }
}
