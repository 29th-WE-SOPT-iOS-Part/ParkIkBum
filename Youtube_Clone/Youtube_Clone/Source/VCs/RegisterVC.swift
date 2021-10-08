//
//  RegisterVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/08.
//

import UIKit
import SnapKit

class RegisterVC: UIViewController {
    
    var checkCnt: Int = 0;
    
    
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "google")
    }
    private let LoginHeadLabel = UILabel().then{
        $0.text = "회원가입"
        $0.font = UIFont.boldSystemFont(ofSize: 40)
        $0.textAlignment = .center
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
        $0.isSecureTextEntry = true
    }
    private let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
    private let checkButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
        $0.addTarget(self, action: #selector(isCheckedClicked(_:)), for: .touchUpInside)

    }
    private let checkLabel = UILabel().then{
        $0.text = "비밀번호 표시"
        $0.font = UIFont.systemFont(ofSize: 15)
    }

//MARK: Func
    @objc private func isCheckedClicked(_ sender: UIButton){
        if checkCnt == 0{
        checkButton.setBackgroundImage(UIImage(named: "checked"), for: .normal)
        pwdTextField.isSecureTextEntry = false
        checkCnt = 1
        }
        else if checkCnt == 1{
            checkButton.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
            pwdTextField.isSecureTextEntry = true
            checkCnt = 0
        }
        
        
    }
    
    func setLayout(){
        self.view.addSubview(logoImageView)
        self.view.addSubview(LoginHeadLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(pwdTextField)
        self.view.addSubview(checkButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(checkLabel)

        //top left bottom right
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-140)
            $0.height.equalTo(40)
        }
        LoginHeadLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(LoginHeadLabel.snp.bottom).offset(90)
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
        checkButton.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(20)
            $0.width.equalTo(20)
        }
        checkLabel.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(10)
            $0.leading.equalTo(checkButton.snp.trailing).offset(10)
            $0.width.equalTo(100)
        }
        nextButton.snp.makeConstraints{
            $0.top.equalTo(checkButton.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(50)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    


}