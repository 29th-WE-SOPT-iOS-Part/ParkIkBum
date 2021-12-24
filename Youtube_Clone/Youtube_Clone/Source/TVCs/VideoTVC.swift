//
//  VideoTVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/29.
//

import UIKit
import SnapKit
import Then

protocol isImageViewClickedDelegate{
    func isImageViewClicked(title: String, detail: String, image: String)
}


class VideoTVC: UITableViewCell {
    
    var delegate: isImageViewClickedDelegate?
    var title: String = ""
    var subText: String = ""
    var imageName: String = ""
    
    
    private let videoImageView = UIImageView().then{
        $0.image = UIImage(named: "wesoptAndroidpart")
    }
    
    private let profileImageView = UIImageView().then{
        $0.image = UIImage(named: "wesoptProfile")
    }
    private let nameLabel = UILabel().then{
        $0.text = "ㅇㅇ"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byCharWrapping
        $0.textColor = UIColor.black
    }
    private let subLabel = UILabel().then{
        $0.text = "WE SOPT ・조회수 100만회 ・ 3주 전"
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = UIColor.darkGray
    }
    private let moreButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "moreMenuIcon"), for: .normal)
    }
    
    func setData(titleText: String, detailText: String, image: String){
        nameLabel.text = titleText
        title = titleText
        subLabel.text = detailText
        subText = detailText
        videoImageView.image = UIImage(named: image)
        imageName = image
    }
    
    
    @objc private func imageViewClicked(_ sender: UIImageView){
        print("눌림")
        delegate?.isImageViewClicked(title: title, detail: subText, image: imageName)
    }
    
    
    func setLayout(){
        contentView.addsubViews([videoImageView, profileImageView,nameLabel,subLabel,moreButton])
        
        videoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(212)
        }
        
        profileImageView.snp.makeConstraints{
            $0.top.equalTo(videoImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.height.width.equalTo(36)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(videoImageView.snp.bottom).offset(7)
            $0.trailing.equalToSuperview().offset(0)
            $0.width.height.equalTo(26)
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.top).offset(0)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-19)
            $0.height.equalTo(50)
        }
        subLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel.snp.leading).offset(0)
            $0.trailing.equalTo(nameLabel.snp.trailing).offset(0)
            $0.height.equalTo(16)
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewClicked(_:)))
        videoImageView.isUserInteractionEnabled = true
        videoImageView.addGestureRecognizer(tapGesture)
        setLayout()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
