//
//  CompleteLoginVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class CompleteLoginVC: UIViewController {
    
    var name:String = "none"
    
    
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "google")
    }
    
   
    
    private let okButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(okButtonClicked(_:)), for: .touchUpInside)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func okButtonClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func setLayout(){
        let hiLabel = UILabel().then{
            $0.text = "\(name)님 \n환영합니다."
            $0.font = UIFont.boldSystemFont(ofSize: 40)
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .center
        }
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(hiLabel)
        self.view.addSubview(okButton)
        
        
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-140)
            $0.height.equalTo(40)
        }
        hiLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.width.equalTo(150)
            $0.height.equalTo(200)
        }
        okButton.snp.makeConstraints{
            $0.top.equalTo(hiLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(50)
        }
        
    }
    


}
