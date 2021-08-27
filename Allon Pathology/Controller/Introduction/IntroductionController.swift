//
//  IntroductionController.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit

class IntroductionController: ParentController {
    
    //MARK:- UIElements
    let top_Image = ImageView(imageName: "navbarbg_icon")
    let side_menu_icon = ImageView(imageName: "hamburger")
    let introductiontitle = Label(text: "The Allons Atlas of Oral &\nMaxillofacial Pathology", textColor: .white, font: .setFont(fontName: .Poppins_Medium, fontSize: 20), alingment: .natural)
    let lblDocName = Label(text: "Dr. Irit Allon • Dr. Iftah Yanai", textColor: .white, font: .setFont(fontName: .Poppins_Light, fontSize: 16), alingment: .natural)
    let title_bg_image = ImageView(imageName: "titlebg_icon")
    let title_atom = ImageView(imageName: "atom_icon")
    let textContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let introLogo = ImageView(imageName: "logo")
    let introductionLabel = Label(text: "Introduction", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
    let textLine : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textView : UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.font = .setFont(fontName: .Poppins_Regular, fontSize: 16.heightRatio)
        tv.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tv.text = "Welcome to the Allon atlas of oral and maxillo-facial pathology. This app is designed to teach medical and dental students, residents, fellows, and practicing pathologists . The material include numerous examples that uploud on a regular basis from our library and newly updating literature and medical articles that related to oral  and maxillofacial pathology (reference in barcode).\n\nThe app composed of diagnosis albums that dived to categories .This categories divided into they're subcategories : an interactive teaching algorithm for a histological and histopathological image atlas.\n\nQuis : the quiz contains multiple choice questions for self study.\n\nContact us : our personal email for any additional questions or proposals .\n\nThis atlas of oral and maxillofacial pathology is only for educational purpose made able by Allon Pathology, for personal , non commercial teaching and educational use. The cases will update by licensed physicians . This application is not medical advice or subtitled for medical diagnosis and health related decisions."
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SideMenu.selectedIndex = 0
        setupConstraint()
    }
    
     func setupConstraint() {
        view.addSubview(top_Image)
        view.addSubview(side_menu_icon)
        view.addSubview(title_atom)
        view.addSubview(title_bg_image)
        view.addSubview(introLogo)
        title_bg_image.addSubview(textContainerView)
        textContainerView.addSubview(introductiontitle)
        textContainerView.addSubview(lblDocName)
        view.addSubview(introductionLabel)
        view.addSubview(textLine)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            top_Image.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: -48.widthRatio),
            top_Image.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 48.widthRatio),
            top_Image.topAnchor.constraint(equalTo: view.topAnchor , constant:  -44.heightRatio),
            top_Image.heightAnchor.constraint(equalToConstant: 340.heightRatio),
            
            side_menu_icon.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            side_menu_icon.heightAnchor.constraint(equalTo: side_menu_icon.widthAnchor),
            side_menu_icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            side_menu_icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.heightRatio),
            
            title_bg_image.heightAnchor.constraint(equalToConstant: 150.heightRatio),
           
            title_bg_image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -38.widthRatio),
            
            title_bg_image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            
            
            title_bg_image.bottomAnchor.constraint(equalTo: top_Image.bottomAnchor, constant: 40.heightRatio),
            
            title_atom.widthAnchor.constraint(equalTo: title_atom.heightAnchor),
            title_atom.heightAnchor.constraint(equalToConstant: 170.heightRatio),
            title_atom.bottomAnchor.constraint(equalTo: top_Image.bottomAnchor, constant: -35.heightRatio),
            
            title_atom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35.widthRatio),
            
            textContainerView.centerYAnchor.constraint(equalTo: title_bg_image.centerYAnchor),
            textContainerView.trailingAnchor.constraint(equalTo: title_bg_image.trailingAnchor, constant: -67.widthRatio),
            
            introductiontitle.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
            introductiontitle.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
            introductiontitle.topAnchor.constraint(equalTo: textContainerView.topAnchor),
            introductiontitle.bottomAnchor.constraint(equalTo: lblDocName.topAnchor, constant: -3.widthRatio),
            
            lblDocName.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
            lblDocName.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor),
            lblDocName.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor),
            
            
            introLogo.widthAnchor.constraint(equalToConstant: 138.autoSized),
            introLogo.heightAnchor.constraint(equalToConstant: 93.autoSized),
            introLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 55.heightRatio),
            introLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            introductionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            introductionLabel.topAnchor.constraint(equalTo: top_Image.bottomAnchor, constant: 50.heightRatio),
            
            textLine.heightAnchor.constraint(equalToConstant: 1),
            textLine.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            textLine.centerYAnchor.constraint(equalTo: introductionLabel.centerYAnchor),
            textLine.leadingAnchor.constraint(equalTo: introductionLabel.trailingAnchor, constant: 10.widthRatio),
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            textView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10.heightRatio),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.heightRatio),
        ])
    }

}
