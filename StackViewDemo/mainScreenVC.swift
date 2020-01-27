//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Benjamin Kurrek  on 2019-11-10.
//  Copyright © 2019 BenG. All rights reserved.

//

import UIKit
import SnapKit
import AVFoundation

class mainScreenVC: UIViewController, CAAnimationDelegate {
    var toggleMusic = false
    let gradient = CAGradientLayer()
    
    // list of array holding 2 colors
    var gradientSet = [[CGColor]]()
    // current gradient index
    var currentGradient: Int = 0
    
    // colors to be added to the set
    let colorOne = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicPlayer.shared.startBackgroundMusic()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    
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
        gradient.frame = self.view.bounds
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

    let playButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .label //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("Play Button", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.cornerRadius = 7
        return button
        
    }()
    
    let instructionsButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .label //create custom button !
        button.setTitle("Instructions Button", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    let noMusicButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .label //create custom button !
        button.setTitle("Toggle Music", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.systemBackground, for: .normal) //system background saying anti label (if light mode, then black)
        button.layer.cornerRadius = 7
        return button
    }()
    
    var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImageView") //creating instance of ui image view and assigining it to logoImageView and returning the instance.
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    func setUpView() {
        view.backgroundColor = .red
        self.view.addSubview(logoImageView)
        self.view.addSubview(playButton)
        self.view.addSubview(instructionsButton)
        self.view.addSubview(noMusicButton) //make sure they have same parent by adding subview FIRST
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.height.equalTo(40)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(20)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(-20) //do this later
            
        }
        playButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(logoImageView.snp.bottom).offset(40) //screw around with this
            make.height.equalTo(25) //buttons 25 is good
            make.width.equalTo(150)
        }
        playButton.addTarget(self, action: #selector(self.playButtonPressed),for: .touchUpInside)
        //a way for the compiler to 
        instructionsButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(playButton.snp.bottom).offset(40) //screw around with this
            make.height.equalTo(25) //buttons 25 is good
            make.width.equalTo(150)
        }
        instructionsButton.addTarget(self, action: #selector(self.instructionsButtonPressed),for: .touchUpInside)
        
        noMusicButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.centerX.equalTo(self.view) //arrange in x axis of view
            make.top.equalTo(instructionsButton.snp.bottom).offset(40) //screw around with this
            make.height.equalTo(25) //buttons 25 is good
            make.width.equalTo(150)
        }
        noMusicButton.addTarget(self, action: #selector(self.noMusicButtonPressed),for: .touchUpInside)
 
        
    }
    @objc func noMusicButtonPressed () { //denoting that it is an objective c function
        toggleMusic.toggle()
        UIView.animate(withDuration: 0.2,
        animations: {
            self.noMusicButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.noMusicButton.transform = CGAffineTransform.identity
            }
        })
        if toggleMusic == true {
            MusicPlayer.shared.stopBackgroundMusic()
        } else {
            MusicPlayer.shared.startBackgroundMusic()
        }
    }
    
    @objc func playButtonPressed () { //denoting that it is an objective c function
        let navigationVC = self.navigationController //root view controller (main VC)
        navigationVC!.pushViewController(playScreenVC(), animated: true) //animating transition
    }
    
    @objc func instructionsButtonPressed () { //denoting that it is an objective c function
        let navigationVC = self.navigationController //root view controller (main VC)
        navigationVC!.pushViewController(instructionsVC(), animated: false) //animating transition
    }
    
}

