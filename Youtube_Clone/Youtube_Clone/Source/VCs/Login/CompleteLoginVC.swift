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
        
    
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "logo")
    }
    
    private lazy var okButton = UIButton().then{
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        $0.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(okButtonClicked(_:)), for: .touchUpInside)

    }
    private lazy var anotherLoginButton = UIButton().then{
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.addTarget(self, action: #selector(anotherLoginClicked(_:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func anotherLoginClicked(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func okButtonClicked(_ sender: UIButton){
            guard let homeVC = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabbarVC") as? TabbarVC else {return}
        homeVC.modalPresentationStyle = .overFullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    
    func setLayout(){
        self.view.backgroundColor = UIColor.white
        let hiLabel = UILabel().then{
            $0.text = "\(UserDefaults.standard.string(forKey: "userName") ?? "none")님 \n환영합니다."
            $0.font = UIFont.boldSystemFont(ofSize: 26)
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .center
        }
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(hiLabel)
        self.view.addSubview(okButton)
        self.view.addSubview(anotherLoginButton)
        
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(248)
            $0.leading.equalToSuperview().offset(128)
            $0.trailing.equalToSuperview().offset(-128)
            $0.height.equalTo(40)
        }
        hiLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(123)
            $0.trailing.equalToSuperview().offset(-123)
            $0.height.equalTo(78)
        }
        okButton.snp.makeConstraints{
            $0.top.equalTo(hiLabel.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
        }
        anotherLoginButton.snp.makeConstraints{
            $0.top.equalTo(okButton.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(113)
            $0.trailing.equalToSuperview().offset(-113)
            $0.height.equalTo(22)
        }
        
    }
    


}
