

//
//  File.swift
//  StackViewDemo
//
//  Created by Benjamin Kurrek  on 2020-01-26.
//  Copyright © 2020 BenG. All rights reserved.
//

import UIKit
import SnapKit

class playScreenVC: UIViewController {
    var lineOne: [Bool] = [true,true,true,true,true], lineTwo: [Bool] = [true,true,true,true], lineThree: [Bool] = [true,true,true], lineFour: [Bool] = [true,true], lineFive: [Bool] = [true], buttonSwitch: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true], solidifyEntry: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    
    var playDidWin = false
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        self.view.addSubview(turnDoneButton)
        self.view.addSubview(backButton)
        self.view.addSubview(oneButton)
        self.view.addSubview(twoButton)
        self.view.addSubview(threeButton)
        self.view.addSubview(fourButton)
        self.view.addSubview(fiveButton)
        self.view.addSubview(sixButton)
        self.view.addSubview(sevenButton)
        self.view.addSubview(eightButton)
        self.view.addSubview(nineButton)
        self.view.addSubview(tenButton)
        self.view.addSubview(elevenButton)
        self.view.addSubview(twelveButton)
        self.view.addSubview(thirteenButton)
        self.view.addSubview(fourteenButton)
        self.view.addSubview(fifteenButton)
        self.navigationController?.setNavigationBarHidden(true, animated: false) //hiding the back button
        view.backgroundColor = .blue
        backButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(turnDoneButton)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(50)
            make.height.equalTo(40) //buttons 25 is good
            make.width.equalTo(150)
        }
        backButton.addTarget(self, action: #selector(self.backButtonPressed),for: .touchUpInside)
        turnDoneButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            //make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(20)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-50)
            make.height.equalTo(40) //buttons 25 is good
            make.width.equalTo(150)
        }
        turnDoneButton.addTarget(self, action: #selector(self.turnDone),for: .touchUpInside)
        oneButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            //make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(20)
            make.left.equalTo(twoButton).offset(-70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        oneButton.addTarget(self, action: #selector(self.oneButtonPressed),for: .touchUpInside)
        twoButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(oneButton)
            //make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(20)
            make.left.equalTo(threeButton).offset(-70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        twoButton.addTarget(self, action: #selector(self.twoButtonPressed),for: .touchUpInside)
        threeButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(oneButton)
            make.centerX.equalTo(self.view)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        threeButton.addTarget(self, action: #selector(self.threeButtonPressed),for: .touchUpInside)
        fourButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(oneButton)
            make.left.equalTo(threeButton).offset(70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        fourButton.addTarget(self, action: #selector(self.fourButtonPressed),for: .touchUpInside)
        fiveButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(oneButton)
            make.left.equalTo(fourButton).offset(70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        fiveButton.addTarget(self, action: #selector(self.fiveButtonPressed),for: .touchUpInside)
        sixButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(oneButton).offset(100)
            make.left.equalTo(sevenButton).offset(-70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        sixButton.addTarget(self, action: #selector(self.sixButtonPressed),for: .touchUpInside)
        sevenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(sixButton)
            make.right.equalTo(threeButton).offset(-35)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        sevenButton.addTarget(self, action: #selector(self.sevenButtonPressed),for: .touchUpInside)
        eightButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(sixButton)
            make.left.equalTo(sevenButton).offset(70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        eightButton.addTarget(self, action: #selector(self.eightButtonPressed),for: .touchUpInside)
        nineButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(sixButton)
            make.left.equalTo(eightButton).offset(70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        nineButton.addTarget(self, action: #selector(self.nineButtonPressed),for: .touchUpInside)
        tenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(sixButton).offset(100)
            make.left.equalTo(elevenButton).offset(-70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        tenButton.addTarget(self, action: #selector(self.tenButtonPressed),for: .touchUpInside)
        elevenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(tenButton)
            make.centerX.equalTo(self.view)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        elevenButton.addTarget(self, action: #selector(self.elevenButtonPressed),for: .touchUpInside)
        twelveButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(tenButton)
            make.left.equalTo(elevenButton).offset(70)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        twelveButton.addTarget(self, action: #selector(self.twelveButtonPressed),for: .touchUpInside)
        thirteenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(tenButton).offset(100)
            make.left.equalTo(sevenButton)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        thirteenButton.addTarget(self, action: #selector(self.thirteenButtonPressed),for: .touchUpInside)
        fourteenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(thirteenButton)
            make.left.equalTo(eightButton)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        fourteenButton.addTarget(self, action: #selector(self.fourteenButtonPressed),for: .touchUpInside)
        fifteenButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.top.equalTo(thirteenButton).offset(100)
            //make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(70) //buttons 25 is good
            make.width.equalTo(40)
        }
        fifteenButton.addTarget(self, action: #selector(self.fifteenButtonPressed),for: .touchUpInside)
    }
    
    let backButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("Go Back", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20) //swift doesn't know that we set it so make optional
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    let turnDoneButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("End Turn", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20) //swift doesn't know that we set it so make optional
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let oneButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("1", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let twoButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("2", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let threeButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("3", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let fourButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("4", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let fiveButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("5", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let sixButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("6", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let sevenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("7", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let eightButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("8", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let nineButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("9", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let tenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("10", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let elevenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("11", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let twelveButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("12", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let thirteenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("13", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let fourteenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("14", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    let fifteenButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("15", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15) //swift doesn't know that we set it so make optional
        button.setTitleColor(.red, for: .normal)
        return button
        
    }()
    
    @objc func oneButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[0] == false {
            lineOne[0].toggle()
            buttonSwitch[0].toggle()
            if buttonSwitch[0] == false {
                oneButton.backgroundColor = .black
            } else {
                oneButton.backgroundColor = .white
            }
        }
    }
    @objc func twoButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[1] == false {
            lineOne[1].toggle()
            buttonSwitch[1].toggle()
            if buttonSwitch[1] == false {
                twoButton.backgroundColor = .black
            } else {
                twoButton.backgroundColor = .white
            }
        }
    }
    @objc func threeButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[2] == false  {
            lineOne[2].toggle()
            buttonSwitch[2].toggle()
            if buttonSwitch[2] == false {
                threeButton.backgroundColor = .black
            } else {
                threeButton.backgroundColor = .white
            }
        }
    }
    @objc func fourButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[3] == false  {
            lineOne[3].toggle()
            buttonSwitch[3].toggle()
            if buttonSwitch[3] == false {
                fourButton.backgroundColor = .black
            } else {
                fourButton.backgroundColor = .white
            }
        }
    }
    @objc func fiveButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[4] == false  {
            buttonSwitch[4].toggle()
            if buttonSwitch[4] == false {
                fiveButton.backgroundColor = .black
            } else {
                fiveButton.backgroundColor = .white
            }
        }
    }
    @objc func sixButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[5] == false  {
            lineTwo[0].toggle()
            buttonSwitch[5].toggle()
            if buttonSwitch[5] == false {
                sixButton.backgroundColor = .black
            } else {
                sixButton.backgroundColor = .white
            }
        }
    }
    @objc func sevenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[6] == false  {
            lineTwo[1].toggle()
            buttonSwitch[6].toggle()
            if buttonSwitch[6] == false {
                sevenButton.backgroundColor = .black
            } else {
                sevenButton.backgroundColor = .white
            }
        }
    }
    @objc func eightButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[7] == false {
            lineTwo[2].toggle()
            buttonSwitch[7].toggle()
            if buttonSwitch[7] == false {
                eightButton.backgroundColor = .black
            } else {
                eightButton.backgroundColor = .white
            }
        }
    }
    @objc func nineButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[8] == false  {
            lineTwo[3].toggle()
            buttonSwitch[8].toggle()
            if buttonSwitch[8] == false {
                nineButton.backgroundColor = .black
            } else {
                nineButton.backgroundColor = .white
            }
        }
    }
    @objc func tenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[9] == false  {
            lineThree[0].toggle()
            buttonSwitch[9].toggle()
            if buttonSwitch[9] == false {
                tenButton.backgroundColor = .black
            } else {
                tenButton.backgroundColor = .white
            }
        }
    }
    @objc func elevenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[10] == false  {
            lineThree[1].toggle()
            buttonSwitch[10].toggle()
            if buttonSwitch[10] == false {
                elevenButton.backgroundColor = .black
            } else {
                elevenButton.backgroundColor = .white
            }
        }
    }
    @objc func twelveButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[11] == false  {
            lineThree[2].toggle()
            buttonSwitch[11].toggle()
            if buttonSwitch[11] == false {
                twelveButton.backgroundColor = .black
            } else {
                twelveButton.backgroundColor = .white
            }
        }
    }
    @objc func thirteenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[12] == false  {
            lineFour[0].toggle()
            buttonSwitch[12].toggle()
            if buttonSwitch[12] == false {
                thirteenButton.backgroundColor = .black
            } else {
                thirteenButton.backgroundColor = .white
            }
        }
    }
    @objc func fourteenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[13] == false  {
            lineFour[1].toggle()
            buttonSwitch[13].toggle()
            if buttonSwitch[13] == false {
                fourteenButton.backgroundColor = .black
            } else {
                fourteenButton.backgroundColor = .white
            }
        }
    }
    @objc func fifteenButtonPressed () { //denoting that it is an objective c function
        if solidifyEntry[14] == false {
            lineFive[0].toggle()
            buttonSwitch[14].toggle()
            if buttonSwitch[14] == false {
                fifteenButton.backgroundColor = .black
            } else {
                fifteenButton.backgroundColor = .white
            }
        }
    }
    
    
    func displayWinnerMessage() {
        let alertController = UIAlertController(title: "Game Over", message:"Congratulations We Have a Winner!", preferredStyle: .alert) //creating the alert
        alertController.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func backButtonPressed () {
        resetButtons()
        resetArrays()
        let navigationVC = self.navigationController //root view controller (main VC)
        navigationVC!.pushViewController(mainScreenVC(), animated: true) //animating transition
    }
    
    @objc func turnDone () { //denoting that it is an objective c function
        
        UIView.animate(withDuration: 0.2,
        animations: {
            self.turnDoneButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.turnDoneButton.transform = CGAffineTransform.identity
            }
        })
        
        total += tallyArrays(array: lineOne)
        total += tallyArrays(array: lineTwo)
        total += tallyArrays(array: lineThree)
        total += tallyArrays(array: lineFour)
        total += tallyArrays(array: lineFive)
        
        for (index, buttons) in buttonSwitch.enumerated() {
            if buttons == false {
                solidifyEntry[index] = true
            }
        }
        if total == 1 {
            displayWinnerMessage()
            resetArrays()
            resetButtons()
            playDidWin = false
        }
        total = 0
    }
    
    func resetArrays() {
        solidifyEntry = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
        buttonSwitch = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
        lineOne = [true,true,true,true,true]
        lineTwo = [true,true,true,true]
        lineThree = [true,true,true]
        lineFour = [true,true]
        lineFive = [true]
    }
    
    func tallyArrays(array: [Bool]) -> Int {
        var activated = 0
        for buttons in array {
            if buttons == true {
                activated += 1
            }
        }
        return activated
    }
    
    func resetButtons () {
            oneButton.backgroundColor = .white
            twoButton.backgroundColor = .white
            threeButton.backgroundColor = .white
            fourButton.backgroundColor = .white
            fiveButton.backgroundColor = .white
            sixButton.backgroundColor = .white
            sevenButton.backgroundColor = .white
            eightButton.backgroundColor = .white
            nineButton.backgroundColor = .white
            tenButton.backgroundColor = .white
            elevenButton.backgroundColor = .white
            twelveButton.backgroundColor = .white
            thirteenButton.backgroundColor = .white
            fourteenButton.backgroundColor = .white
            fifteenButton.backgroundColor = .white
        }
}



