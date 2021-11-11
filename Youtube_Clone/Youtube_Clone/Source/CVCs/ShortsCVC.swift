//
//  ShortsCVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/29.
//

import UIKit
import Then
import SnapKit

class ShortsCVC: UICollectionViewCell {
    
    static let identifier: String = "ShortsCVC"
    
    private let backgroundVeiw = UIView().then{
        $0.backgroundColor = UIColor.white
    }
    
    private let imageView = UIImageView().then{
        $0.image = UIImage(named: "ggamju1-1")
    }
    private let nameLabel = UILabel().then{
        $0.text = "하나둘셋"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.darkGray
        $0.textAlignment = .center
    }
    
    func setLayout(){
        
        contentView.addSubview(backgroundVeiw)
        backgroundVeiw.addsubViews([imageView, nameLabel])
        
        backgroundVeiw.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview().offset(0)
            $0.width.equalTo(104)
            $0.height.equalTo(72)
        }
        
        imageView.snp.makeConstraints{
            $0.width.equalTo(58)
            $0.height.equalTo(58)
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(7)
            $0.trailing.equalToSuperview().offset(-7)
            $0.height.equalTo(13)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        // Initialization code
    }

}
