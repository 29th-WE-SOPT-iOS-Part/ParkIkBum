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
        $0.image = UIImage(named: "logo")
    }
    private let LoginHeadLabel = UILabel().then{
        $0.text = "회원가입"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textAlignment = .center
    }
    private let nameTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.placeholder = " 이름을 입력해주세요"
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    private let emailTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.placeholder = " 이메일 또는 휴대전화"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    private let pwdTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.placeholder = " 비밀번호 입력"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    private let nextButton = UIButton().then{
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        $0.backgroundColor = UIColor.systemGray
        $0.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)

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
    @objc private func nextButtonClicked(_ sender: UIButton){
        guard let completeVC = UIStoryboard(name: "CompleteLogin", bundle: nil).instantiateViewController(withIdentifier: "CompleteLoginVC") as? CompleteLoginVC else {return}
        
        if (nameTextField.text != "" && emailTextField.text != "" && pwdTextField.text != ""){
            nextButton.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
            completeVC.name = nameTextField.text!
            completeVC.modalPresentationStyle = .overFullScreen
            self.present(completeVC, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            nextButton.backgroundColor = UIColor.systemGray

        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if (nameTextField.text != "" && emailTextField.text != "" && pwdTextField.text != ""){
            nextButton.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        }
        else{
            nextButton.backgroundColor = UIColor.systemGray

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
            $0.top.equalToSuperview().offset(110)
            $0.leading.equalToSuperview().offset(130)
            $0.trailing.equalToSuperview().offset(-130)
            $0.height.equalTo(40)
        }
        LoginHeadLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(147)
            $0.trailing.equalToSuperview().offset(-147)
            $0.height.equalTo(24)
        }
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(LoginHeadLabel.snp.bottom).offset(128)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(331)
            $0.height.equalTo(48)
        }
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(331)
            $0.height.equalTo(48)
        }
        pwdTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(331)
            $0.height.equalTo(48)
        }
        checkButton.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(10)
            $0.leading.equalTo(pwdTextField.snp.leading).offset(0)
            $0.height.equalTo(20)
            $0.width.equalTo(20)
        }
        checkLabel.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(10)
            $0.leading.equalTo(checkButton.snp.trailing).offset(10)
            $0.width.equalTo(100)
        }
        nextButton.snp.makeConstraints{
            $0.top.equalTo(checkButton.snp.bottom).offset(29)
            $0.leading.equalTo(pwdTextField.snp.leading).offset(0)
            $0.trailing.equalTo(pwdTextField.snp.trailing).offset(0)
            $0.height.equalTo(42)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    


}
