//
//  DetailVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/12/24.
//

import UIKit
import SnapKit
import Then

class DetailVC: UIViewController {
    
    private let imageView = UIImageView().then{
        $0.image = UIImage(named: "wesoptAndroidpart")
    }
    
    private let titleLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = UIColor.black
        $0.lineBreakMode = .byCharWrapping
        $0.numberOfLines = 2
    }
    
    private let detailLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = UIColor.systemGray
    }
    private let backButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "icn_dismissBtn"), for: .normal)
        $0.addTarget(self, action: #selector(dismissButtonClicked(_:)), for: .touchUpInside)
    }
    private let expandButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "icn_expandBtn"), for: .normal)
    }
    
    
    func setData(title: String, detail: String, image: String){
        titleLabel.text = title
        detailLabel.text = detail
        imageView.image = UIImage(named: image)
    }
    
    
    func setLayout(){
        view.addsubViews([imageView, titleLabel, detailLabel, backButton, expandButton])
        
        imageView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(212)
        }
        backButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(50)
            $0.height.width.equalTo(48)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(270)
        }
        expandButton.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-7)
            $0.width.height.equalTo(26)
        }
        detailLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(270)
        }
    }
    
    @objc private func dismissButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    


}
