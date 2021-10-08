//
//  LoginVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/08.
//

import UIKit
import SnapKit
import Then

class LoginVC: UIViewController {
//MARK: VAR
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "google")
    }
    private let LoginHeadLabel = UILabel().then{
        $0.text = "로그인"
        $0.font = UIFont.boldSystemFont(ofSize: 40)
        $0.textAlignment = .center
    }
    private let explaneLabel = UILabel().then{
        $0.textColor = UIColor.lightGray
        $0.text = "Youtube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인 됩니다."
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let nameTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.placeholder = "  이름을 입력해주세요"
    }
    private let emailTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.placeholder = "  이메일 또는 휴대전화"
    }
    private let pwdTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.placeholder = "  비밀번호 입력"
    }
    private let makeAccoutButton = UIButton().then{
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.setTitle("계정만들기", for: .normal)
    }
    private let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
    
//MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        print("dfaf")
        self.view.backgroundColor = UIColor.white
    }

//MARK: Function
    func setLayout(){
        self.view.addSubview(logoImageView)
        self.view.addSubview(LoginHeadLabel)
        self.view.addSubview(explaneLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(pwdTextField)
        self.view.addSubview(makeAccoutButton)
        self.view.addSubview(nextButton)

        //top left bottom right
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.left.equalToSuperview().offset(140)
            $0.right.equalToSuperview().offset(-140)
            $0.height.equalTo(40)
        }
        LoginHeadLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(25)
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        explaneLabel.snp.makeConstraints{
            $0.top.equalTo(LoginHeadLabel.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(explaneLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(60)
        }
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(60)
        }
        pwdTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(60)
        }
        makeAccoutButton.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(50)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(80)
        }
        nextButton.snp.makeConstraints{
            $0.centerY.equalTo(makeAccoutButton.snp.centerY)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
            $0.width.equalTo(80)
        }
    }
    

}
