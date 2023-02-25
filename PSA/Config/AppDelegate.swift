//
//  AppDelegate.swift
//  PSA
//
//  Created by Fei Zhang on 2023/2/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = rootViewController()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }

}

extension UIApplicationDelegate {

    /// App root viewcontroller
    /// - Returns: root vc
    func rootViewController() -> UIViewController {
        return GuideViewController()
    }

    /// Reset app root viewcontroller and sub viewcontroller
    func rebootApplication() {
        // Maybe rewrite this logic due to release feture.
        // https://juejin.cn/post/6844903687991590920
        // https://www.cxyzjd.com/article/Forever_wj/108210234
        UIApplication.shared.keyWindow()?.rootViewController = rootViewController()
    }
}

extension UIApplication {
    /// App key window
    /// - Returns: window
    func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
                        .filter({ $0.activationState == .foregroundActive })
                        .map({ $0 as? UIWindowScene })
                        .compactMap({ $0 })
                        .last?.windows
                        .filter({ $0.isKeyWindow })
                        .last
    }
}
