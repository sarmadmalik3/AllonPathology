//
//  IntroductionController.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit

class IntroductionController: ParentController {
    
    //MARK:- UIElements
    let introductionLabel = Label(text: "Introduction", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
    let line : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textView : UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = .setFont(fontName: .Poppins_Regular, fontSize: 16.heightRatio)
        tv.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tv.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SideMenu.selectedIndex = 0
        
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(introductionLabel)
        view.addSubview(line)
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            introductionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            introductionLabel.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: 50.heightRatio),
            
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            line.centerYAnchor.constraint(equalTo: introductionLabel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: introductionLabel.trailingAnchor, constant: 10.widthRatio),
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            textView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10.heightRatio),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.heightRatio),
        ])
    }

}
