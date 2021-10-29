//
//  HomeVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/21.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    private let tableView = UITableView().then{
        $0.backgroundColor = UIColor.white
        $0.separatorStyle = .none
    }
    
    private let headerView = UIView().then{
        $0.backgroundColor = UIColor.white
    }
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "premiumLogo")
    }
    private let windowShareButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "windowSharingIcon"), for: .normal)
    }
    private let notificationButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "notificationIcon"), for: .normal)
    }
    private let searchButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "SearchIcon"), for: .normal)
    }
    private let profileButton = UIButton().then{
        $0.setBackgroundImage(UIImage(named: "wesoptProfile"), for: .normal)
    }

    
    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setHeaderViewLayout()
        tableViewLayout()
    }
    
    func tableViewLayout(){
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCustomXib(xibName: "ShortsTVC")
        tableView.registerCustomXib(xibName: "VideoTVC")
        tableView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(30)
            $0.leading.trailing.bottom.equalToSuperview().offset(0)
        }
    }
    
    
    func setHeaderViewLayout(){
        self.view.addSubview(headerView)
        headerView.addsubViews([logoImageView, windowShareButton, notificationButton, searchButton, profileButton])
        
        headerView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(20)
        }
        
        logoImageView.snp.makeConstraints{
            $0.leading.equalTo(headerView).offset(16)
            $0.top.equalTo(headerView).offset(11)
            $0.bottom.equalTo(headerView).offset(13)
            $0.width.equalTo(96)
        }
        
        profileButton.snp.makeConstraints{
            $0.trailing.equalTo(headerView).offset(-16)
            $0.centerY.equalTo(logoImageView)
            $0.width.height.equalTo(24)
        }
        searchButton.snp.makeConstraints{
            $0.trailing.equalTo(profileButton.snp.leading).offset(-17)
            $0.centerY.equalTo(logoImageView)
            $0.width.height.equalTo(32)
        }
        notificationButton.snp.makeConstraints{
            $0.trailing.equalTo(searchButton.snp.leading).offset(-11)
            $0.centerY.equalTo(logoImageView)
            $0.width.height.equalTo(32)
        }
        windowShareButton.snp.makeConstraints{
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-12)
            $0.centerY.equalTo(logoImageView)
            $0.width.height.equalTo(32)
        }
        
    }
    
}


extension HomeVC: UITableViewDelegate{
    
}
    
extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 104
        }
        else{
            return 306
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShortsTVC") as! ShortsTVC
        let videoCell = tableView.dequeueReusableCell(withIdentifier: "VideoTVC") as! VideoTVC
        
        if(indexPath.row == 0){
            cell.selectionStyle = .none
            return cell
        }
        else{
            return videoCell
        }
    }
    
    
}
