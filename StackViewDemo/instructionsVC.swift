//
//  File.swift
//  StackViewDemo
//
//  Created by Benjamin Kurrek  on 2020-01-26.
//  Copyright © 2020 BenG. All rights reserved.
//

import UIKit
import SnapKit

class instructionsVC: UIViewController, CAAnimationDelegate {
    let gradient = CAGradientLayer()

    // list of array holding 2 colors
    var gradientSet = [[CGColor]]()
    // current gradient index
    var currentGradient: Int = 0
    
    // colors to be added to the set
    let colorOne = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createGradientView()
    }
    
    //create gradient View
    func createGradientView() {
        
        // overlap the colors and make it 3 sets of colors
        gradientSet.append([colorOne, colorTwo])
        gradientSet.append([colorTwo, colorThree])
        gradientSet.append([colorThree, colorOne])
        
        // set the gradient size to be the entire screen
        gradient.frame = UIScreen.main.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        animateGradient()
    }
        
    func animateGradient() {
        // cycle through all the colors, feel free to add more to the set
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        // animate over 3 seconds
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 3.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.delegate = self
        gradient.add(gradientChangeAnimation, forKey: "gradientChangeAnimation")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            // if our gradient animation ended animating, restart the animation by changing the color set
            if flag {
                gradient.colors = gradientSet[currentGradient]
                animateGradient()
            }
        }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false) //hiding the back button
        self.view.addSubview(backInstButton)
        self.view.addSubview(logoImageView)
        self.view.addSubview(instructionsOneLabel)
        self.view.addSubview(instructionsTwoLabel)
        self.view.addSubview(instructionsThreeLabel)
        self.view.addSubview(instructionsFourLabel)
        self.view.addSubview(matchLogoImageView)
        self.view.addSubview(matchLogoMImageView)
        backInstButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-100)
            make.centerX.equalTo(self.view)
            make.height.equalTo(40) //buttons 25 is good
            make.width.equalTo(150)
        }
        logoImageView.snp.makeConstraints { (make) in
        make.centerX.equalTo(self.view) //arrange in x axis of view
        make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        matchLogoMImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
        }
        backInstButton.addTarget(self, action: #selector(self.backInstButtonPressed),for: .touchUpInside)

        instructionsOneLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(300)
        }
        instructionsTwoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(instructionsOneLabel.snp.left) //arrange in x axis of view
            make.top.equalTo(instructionsOneLabel.snp.bottom).offset(20)
        }
        instructionsThreeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(instructionsTwoLabel.snp.left) //arrange in x axis of view
            make.top.equalTo(instructionsTwoLabel.snp.bottom).offset(20)
        }
        instructionsFourLabel.snp.makeConstraints { (make) in
            make.left.equalTo(instructionsTwoLabel.snp.left) //arrange in x axis of view
            make.top.equalTo(instructionsThreeLabel.snp.bottom).offset(20)
        }
        matchLogoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(instructionsFourLabel.snp.bottom).offset(30)
        }
    }
    
    var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Matches Title") //creating instance of ui image view and assigining it to logoImageView and returning the instance.
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    let backInstButton: UIButton = {
        let button = UIButton()
       button.backgroundColor = .systemPink //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
       button.setTitle("Back", for: .normal)  //setting a name for your button with normal condition
       button.isUserInteractionEnabled = true //setting button as user interactable
       button.clipsToBounds = true //stays within its constraints
       button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 30) //swift doesn't know that we set it so make optional
       button.setTitleColor(UIColor.appBG, for: .normal)
       button.layer.cornerRadius = 7
       return button
    }()
    
    let instructionsOneLabel: UILabel = {
           let label = UILabel()
            label.numberOfLines = 0;
            label.textAlignment = NSTextAlignment.center
            label.text = "1) Take as many matches from ONE ROW"
            label.font = UIFont(name: "Montserrat-Bold", size: 15)
            label.backgroundColor = .systemPink
            label.textColor = UIColor.appBG
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 7
           return label
       }()
    var matchLogoMImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Matches Logo M") //creating instance of ui image view and assigining it to logoImageView and returning the instance.
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    let instructionsTwoLabel: UILabel = {
        let label = UILabel()
         label.numberOfLines = 0;
        label.textAlignment = NSTextAlignment.center
        label.text = "2) Take from ONE row ONLY"
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.backgroundColor = .systemPink
        label.textColor = UIColor.appBG
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        return label
    }()
    
    let instructionsThreeLabel: UILabel = {
        let label = UILabel()
         label.numberOfLines = 0;
        label.textAlignment = NSTextAlignment.center
        label.text = "3) When done, hit 'End Turn'"
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.backgroundColor = .systemPink
        label.textColor = UIColor.appBG
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        return label
    }()
    
    let instructionsFourLabel: UILabel = {
        let label = UILabel()
         label.numberOfLines = 0;
        label.textAlignment = NSTextAlignment.center
        label.text = "4) Whoever Hits the LAST Match LOSES"
        label.font = UIFont(name: "Montserrat-Bold", size: 15)
        label.backgroundColor = .systemPink
        label.textColor = UIColor.appBG
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        return label
    }()
    var matchLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Matches Logo") //creating instance of ui image view and assigining it to logoImageView and returning the instance.
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    @objc func backInstButtonPressed () {
        let navigationVC = self.navigationController //root view controller (main VC)
        navigationVC!.pushViewController(mainScreenVC(), animated: true) //animating transition
    }
}



