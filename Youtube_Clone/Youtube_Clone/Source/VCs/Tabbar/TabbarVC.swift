//
//  TabbarVC.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/21.
//

import UIKit

class TabbarVC: UITabBarController {

    static let identifier = "TabbarVC"
    public var addressMainVC: HomeVC?
    public var tabs: [UIViewController] = []
    private var comeBackIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarCustomFrame()
        configTabbar()
        
   }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedViewController = tabs[comeBackIndex]
    }
    private func setTabbarCustomFrame() {
        let customTabbar = tabBar
        var newFrame = CGRect(x: 0,
                              y: self.view.frame.size.height - 70,
                              width:  self.view.frame.size.width,
                              height: 70)
        customTabbar.frame = newFrame
    }

    private func configTabbar(){
        
        let customTabbar = tabBar
        customTabbar.tintColor = UIColor.black
        customTabbar.unselectedItemTintColor = UIColor.black
        customTabbar.backgroundColor = UIColor.white
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(identifier: "HomeVC")
        let homeTab = UINavigationController(rootViewController: homeVC)
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        
        let ShortsStoryboard = UIStoryboard(name: "Shorts", bundle: nil)
        let ShortsVC = ShortsStoryboard.instantiateViewController(withIdentifier: "ShortsVC")
        let ShortsTab = UINavigationController(rootViewController: ShortsVC)
        ShortsTab.tabBarItem = UITabBarItem(title: "shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
        
        let AddStoryboard = UIStoryboard(name: "Adds", bundle: nil)
        let AddsVC = AddStoryboard.instantiateViewController(withIdentifier: "AddsVC")
        let AddsTab = UINavigationController(rootViewController: AddsVC)
        AddsTab.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon"), selectedImage: UIImage(named: "plueCircleIcon"))
        
        let SubscribeStoryboard = UIStoryboard(name: "Subscribe", bundle: nil)
        let SubscribeVC = SubscribeStoryboard.instantiateViewController(withIdentifier: "SubscribeVC")
        let SubscribeTab = UINavigationController(rootViewController: SubscribeVC)
        SubscribeTab.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        
        let SaveStoryboard = UIStoryboard(name: "Saves", bundle: nil)
        let SaveVC = SaveStoryboard.instantiateViewController(withIdentifier: "SavesVC")
        let SaveTab = UINavigationController(rootViewController: SaveVC)
        SaveTab.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))

        tabs = [homeTab,ShortsTab,AddsTab,SubscribeTab,SaveTab]
        
        setViewControllers(tabs, animated: true)
        selectedViewController = homeTab
    }
    
    
}
