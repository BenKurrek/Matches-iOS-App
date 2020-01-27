//
//  File.swift
//  StackViewDemo
//
//  Created by Benjamin Kurrek  on 2020-01-27.
//  Copyright © 2020 BenG. All rights reserved.
//

extension UIView {
func addBackground() {
    // screen width and height:
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
    imageViewBackground.image = UIImage(named: "YOUR IMAGE NAME GOES HERE")

    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}}
