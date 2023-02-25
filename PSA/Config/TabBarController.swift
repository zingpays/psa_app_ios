//
//  TabBarController.swift
//  PSA
//
//  Created by Fei Zhang on 2023/2/25.
//

import UIKit

class TabBarController: UITabBarController {

    // tabBar viewcontrollers
    var tabVCs: [TabbarItem] = {
        var vcs: [TabbarItem] = []
        vcs.append(TabbarItem(title: "Transactions", vc: TransactionViewController(), normalImage: "iconTransactions", selectedImage: "iconTransactionsSelected"))
        vcs.append(TabbarItem(title: "Recipients", vc: RecipientsViewController(), normalImage: "iconReceipients", selectedImage: "iconReceipientsSelected"))
        vcs.append(TabbarItem(title: "Hub", vc: HubViewController(), normalImage: "iconHub", selectedImage: "iconHubSelected"))
        vcs.append(TabbarItem(title: "Settings", vc: SettingsViewController(), normalImage: "iconSettings", selectedImage: "iconSettingsSelected"))
        return vcs
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        tabBar.backgroundColor = UIColor(named: "#F8F9FB")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var frame = tabBar.frame
        let height = tabBar.frame.size.height + 20
        frame.size.height = height
        frame.origin.y = view.bounds.size.height - height
        tabBar.frame = frame
    }

    private func setupViewControllers() {
        for item in tabVCs {
            addChildVC(childVC: item.vc,
                       title: item.title,
                       normalImage: item.normalImage,
                       selectedImage: item.selectedImage)
        }
    }

    private func addChildVC(childVC: UIViewController, title: String, normalImage: String, selectedImage: String) {
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .highlighted)
        var img = UIImage(named: normalImage)
        img = img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        var selectedImg = UIImage(named: selectedImage)
        selectedImg = selectedImg?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.image = img
        childVC.tabBarItem.selectedImage = selectedImg
        childVC.title = title
        let nav = UINavigationController(rootViewController: childVC)
        addChild(nav)
    }
}

struct TabbarItem {
    let title: String
    let vc: UIViewController
    let normalImage: String
    let selectedImage: String
}

