//
//  FirstPageViewController.swift
//  Elene_Kapanadze_22
//
//  Created by Ellen_Kapii on 13.08.22.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    private lazy var appTitle: UILabel = {
        let appTitle = UILabel()
        appTitle.text = "TOP RATED TV SHOWS"
        appTitle.textColor = .white
        appTitle.font = .boldSystemFont(ofSize: 30)
        appTitle.textAlignment = .center
        view.addSubview(appTitle)
        return appTitle
    }()
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        background.contentMode = .scaleAspectFill
        view.addSubview(background)
        return background
    }()
    
    
    private lazy var diveInButton: UIButton = {
        let diveInButton = UIButton()
        diveInButton.setTitle("Dive In", for: .normal)
        diveInButton.titleLabel?.textAlignment = .center
        diveInButton.backgroundColor = .init(red: 0.2, green: 0.5, blue: 1, alpha: 0.9)
        diveInButton.layer.cornerRadius = 5
        view.addSubview(diveInButton)
        return diveInButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setUp()
        addGestures()
        
    }
    
    //MARK: - Configuration private functions
    
    private func setUp() {
        
        addBackground()
        addAppTitle()
        addDiveInButton()
        
    }
    
    private func addGestures() {
        
        
        addDiveInButtonTap()
        
        
    }
    
    
    //MARK: - Add constraints to views
    
    private func addAppTitle() {
        
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: appTitle,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view.safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: view.frame.height / 4)
        
        let leftConstraint = NSLayoutConstraint(item: appTitle,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 10)
        
        let rightConstraint = NSLayoutConstraint(item: appTitle,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -10)
        
        
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint])
        
        
    }
    
    private func addBackground() {
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: background,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 0)
        
        let leftConstraint = NSLayoutConstraint(item: background,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: background,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: background,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint, bottomConstraint])
        
    }
    
    
    private func addDiveInButton() {
        
        diveInButton.translatesAutoresizingMaskIntoConstraints = false
        
        let height = NSLayoutConstraint(item: diveInButton,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 50)
        
        let leftConstraint = NSLayoutConstraint(item: diveInButton,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 100)
        
        let rightConstraint = NSLayoutConstraint(item: diveInButton,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -100)
        
        let bottomConstraint = NSLayoutConstraint(item: diveInButton,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: -50)
        
        
        
        NSLayoutConstraint.activate([height, rightConstraint, leftConstraint, bottomConstraint])
    }
    
    
    //MARK: - gestures private functions
    
    
    private func addDiveInButtonTap() {
        
        diveInButton.addTarget(self, action: #selector(diveInTapped), for: .touchUpInside)
        
    }
    
    
    @objc private func diveInTapped() {
        
        let vc = MoviesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    
}
