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
        $0.image = UIImage(named: "logo")
    }
    private let LoginHeadLabel = UILabel().then{
        $0.text = "로그인"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textAlignment = .center
    }
    private let explaneLabel = UILabel().then{
        $0.textColor = UIColor.black
        $0.text = "Youtube도 이동하며 계속하세요. \n앱 및 Safari에서도 Google 서비스에 로그인 됩니다."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let nameTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.clipsToBounds = true
        $0.placeholder = "  이름을 입력해주세요"
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    private let emailTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.clipsToBounds = true
        $0.placeholder = " 이메일 또는 휴대전화"
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    private let pwdTextField = UITextField().then{
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray6.cgColor
        $0.layer.cornerRadius = 10
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.clipsToBounds = true
        $0.placeholder = " 비밀번호 입력"
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    private let makeAccoutButton = UIButton().then{
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.setTitle("계정만들기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.addTarget(self, action: #selector(registerButtonClicked(_:)), for: .touchUpInside)

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
    
//MARK: ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if (nameTextField.text != "" && emailTextField.text != "" && pwdTextField.text != ""){
            nextButton.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        }
        else{
            nextButton.backgroundColor = UIColor.systemGray

        }
    }

//MARK: Function
    @objc private func registerButtonClicked(_ sender: UIButton){
        guard let registerVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC else {return}
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc private func nextButtonClicked(_ sender: UIButton){
       
        
        if (nameTextField.hasText && emailTextField.hasText && pwdTextField.hasText){
            nextButton.backgroundColor = UIColor(red: 66.0/255.0, green: 134.0/255.0, blue: 244.0/255.0, alpha: 1.0)
//            completeVC.name = nameTextField.text!
//            completeVC.modalPresentationStyle = .overFullScreen
            
            login()
            
            
            
            
//            self.present(completeVC, animated: true, completion: nil)
//            nameTextField.text = ""
//            emailTextField.text = ""
//            pwdTextField.text = ""
        }
        else{
            nextButton.backgroundColor = UIColor.systemGray

        }
        
       
    }
    
    
    func login(){
        guard let completeVC = UIStoryboard(name: "CompleteLogin", bundle: nil).instantiateViewController(withIdentifier: "CompleteLoginVC") as? CompleteLoginVC else {return}
        
        LoginService.shared.Login(email: emailTextField.text ?? "", password: pwdTextField.text ?? "" ) { [self] result in
            switch result{
            case .success(let data):
                if let response = data as? LoginDataModel{
                    DispatchQueue.global().async {
                        UserDefaults.standard.set(response.data?.name, forKey: "userName")
                    }
                    self.makeAlert(title: "로그인", message: response.message, okAction: {_ in self.present(completeVC, animated: true, completion: nil)}, completion: nil)
                }
            case .requestErr(let msg):
                if let request = msg as? LoginDataModel{
                    self.makeAlert(title: "로그인", message: request.message, okAction: {_ in self.dismiss(animated: true, completion: nil)}, completion: nil)
                }
                print("requestErr")
            default :
                print("ERROR")
            }
        }
    }


    
    
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
            $0.top.equalToSuperview().offset(110)
            $0.left.equalToSuperview().offset(130)
            $0.right.equalToSuperview().offset(-130)
            $0.height.equalTo(40)
        }
        LoginHeadLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(157)
            $0.right.equalToSuperview().offset(-157)
            $0.height.equalTo(24)
        }
        explaneLabel.snp.makeConstraints{
            $0.top.equalTo(LoginHeadLabel.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(44)
            $0.right.equalToSuperview().offset(-44)
            $0.height.equalTo(60)
        }
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(explaneLabel.snp.bottom).offset(68)
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
        makeAccoutButton.snp.makeConstraints{
            $0.top.equalTo(pwdTextField.snp.bottom).offset(73)
            $0.left.equalToSuperview().offset(22)
            $0.height.equalTo(22)
            $0.width.equalTo(68)
        }
        nextButton.snp.makeConstraints{
            $0.centerY.equalTo(makeAccoutButton.snp.centerY)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.width.equalTo(74)
        }
    }
    

}
