//
//  GuideViewController.swift
//  Flashwire
//
//  Created by Fei Zhang on 2022/12/30.
//  Copyright © 2022 Zing Tech. All rights reserved.
//

import UIKit
import FSPagerView

class GuideViewController: UIViewController {
    @IBOutlet weak var guidePagerView: FSPagerView! {
        didSet {
            guidePagerView.register(UINib(nibName: "GuidePagerViewCell", bundle: nil), forCellWithReuseIdentifier: "GuidePagerViewCell")
            guidePagerView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            pageControl.interitemSpacing = 65
            pageControl.contentHorizontalAlignment = .left
            pageControl.contentInsets = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
            pageControl.setFillColor(UIColor(named: "#C3D9ED"), for: .normal)
            pageControl.setFillColor(UIColor(named: "lightBlue"), for: .selected)
            pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 65, height: 2), cornerRadius: 6), for: .selected)
            pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 65, height: 2), cornerRadius: 6), for: .normal)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.backgroundColor = .clear
            registerButton.setTitle("Sign Up", for: .normal)
            registerButton.layer.borderColor = UIColor.white.cgColor
            registerButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle("Log In", for: .normal)
            loginButton.backgroundColor = UIColor(named: "lightBlue")
        }
    }
    /// collection view data source
    private var guideDatas: [GuideCollectionModel] = []
    /// index of page displayed
    var selectedIndex: Int = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "primaryBlue")
        pageControl.numberOfPages = guideDatas.count
    }
    
    private func setupData() {
        let guideData1 = GuideCollectionModel(title: "Make cross-border payments at your fingertips  ", imageName: "guide_bg_intro_1", desc: "Up to 2% cashback on spending on your AURO debit card.")
        let guideData2 = GuideCollectionModel(title: "Meet your global payment needs", imageName: "guide_bg_intro_2", desc: "With AURO credit card, you can pay easily include Online purchases.")
        let guideData3 = GuideCollectionModel(title: "Your international travel, Easily", imageName: "guide_bg_intro_3", desc: "Travel the world with one card, no need to exchange currency, can easily support your travel expenses.")
        let guideData4 = GuideCollectionModel(title: "Your Crypto, Pay for Everything", imageName: "guide_bg_intro_4", desc: "You can sell crypto to the money in the debit card for consumption.")
        guideDatas = [guideData1, guideData2, guideData3, guideData4]
    }

    // MARK: - Actions
    
    @IBAction func registerActon(_ sender: Any) {
//        let vc = RegisterViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
//        let vc = LoginViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - FSPagerViewDataSource && FSPagerViewDelegate

extension GuideViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return guideDatas.count
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "GuidePagerViewCell", at: index)
        cell.contentView.layer.shadowColor = UIColor.clear.cgColor
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        if let guideCell = cell as? GuidePagerViewCell {
            let data = guideDatas[index]
            guideCell.guideImageView?.image = UIImage(named: data.imageName)
            guideCell.titleLabel?.text = data.title
        }
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
}
