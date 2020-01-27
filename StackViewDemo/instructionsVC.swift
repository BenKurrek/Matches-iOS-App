//
//  File.swift
//  StackViewDemo
//
//  Created by Benjamin Kurrek  on 2020-01-26.
//  Copyright © 2020 BenG. All rights reserved.
//

import UIKit
import SnapKit

class instructionsVC: UIViewController, UIImagePickerControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false) //hiding the back button
        self.view.addSubview(backInstButton)
        backInstButton.snp.makeConstraints { (make) in //make is lamda function (in line function)
            //set variables for make and assigned to make constraints
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-150)
            make.centerX.equalTo(self.view)
            make.height.equalTo(40) //buttons 25 is good
            make.width.equalTo(150)
        }
        backInstButton.addTarget(self, action: #selector(self.backInstButtonPressed),for: .touchUpInside)
    }
    let backInstButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red //create custom button ! //by doing .label, accouting for color of phone (dark mode and light mode)
        button.setTitle("Go Back", for: .normal)  //setting a name for your button with normal condition
        button.isUserInteractionEnabled = true //setting button as user interactable
        button.clipsToBounds = true //stays within its constraints
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20) //swift doesn't know that we set it so make optional
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
/*    let instructionsTest: UILabel = {
        let label = UILabel()
        label.backgroundColor = .label
        label.setTitle("You can take as many as you want from one row at a time.", for: .normal)
        label.clipsToBounds = true
        label.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        label.setTitleColor(.white, for: .nomal)
        return label
    }
 */
    @objc func backInstButtonPressed () {
        let navigationVC = self.navigationController //root view controller (main VC)
        navigationVC!.pushViewController(mainScreenVC(), animated: true) //animating transition
    }
}
