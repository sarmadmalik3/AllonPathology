//
//  ParentController.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit

class ParentController: UIViewController {

    let navbg_image = ImageView(imageName: "navbarbg_icon")
    let humburger = ImageView(imageName: "hamburger")
    let titlelabel = Label(text: "The Allons Atlas of Oral &\nMaxillofacial Pathology", textColor: .white, font: .setFont(fontName: .Poppins_Medium, fontSize: 20), alingment: .natural)
    let docNameLabel = Label(text: "Dr. Irit Allon • Dr. Iftah Yanai", textColor: .white, font: .setFont(fontName: .Poppins_Light, fontSize: 16), alingment: .natural)
    let titleImage = ImageView(imageName: "titlebg_icon")
    let atom = ImageView(imageName: "atom_icon")
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let logo = ImageView(imageName: "logo")
    let sideMenu = SideMenu()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleHumbuger))
        humburger.isUserInteractionEnabled = true
        humburger.addGestureRecognizer(tapGesture)
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(openIntroduction), name: Notification.Name(NotificationCenterKey.introductionKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openDiagnosesAlbums), name: Notification.Name(NotificationCenterKey.diagnosesAlbumsKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openQuizme), name: Notification.Name(NotificationCenterKey.quizmeKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openContactUs), name: Notification.Name(NotificationCenterKey.contactusKey), object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    func setupViews() {
        view.addSubview(navbg_image)
        view.addSubview(humburger)
        view.addSubview(atom)
        view.addSubview(titleImage)
        view.addSubview(logo)
        titleImage.addSubview(containerView)
        containerView.addSubview(titlelabel)
        containerView.addSubview(docNameLabel)
        
        NSLayoutConstraint.activate([
            navbg_image.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: -48.widthRatio),
            navbg_image.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 48.widthRatio),
            navbg_image.topAnchor.constraint(equalTo: view.topAnchor , constant:  -44.heightRatio),
            navbg_image.heightAnchor.constraint(equalToConstant: 340.heightRatio),
            
            humburger.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            humburger.heightAnchor.constraint(equalTo: humburger.widthAnchor),
            humburger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            humburger.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.heightRatio),
            
            titleImage.heightAnchor.constraint(equalToConstant: 150.heightRatio),
            titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -38.widthRatio),
            titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            
            titleImage.bottomAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: 40.heightRatio),
            
            atom.widthAnchor.constraint(equalTo: atom.heightAnchor),
            atom.heightAnchor.constraint(equalToConstant: 170.heightRatio),
            atom.bottomAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: -35.heightRatio),
            atom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35.widthRatio),
            
            containerView.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor),
            containerView.trailingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: -67.widthRatio),
            
            titlelabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titlelabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titlelabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titlelabel.bottomAnchor.constraint(equalTo: docNameLabel.topAnchor, constant: -3.widthRatio),
            
            docNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            docNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            docNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            
            logo.widthAnchor.constraint(equalToConstant: 138.widthRatio),
            logo.heightAnchor.constraint(equalToConstant: 93.heightRatio),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 55.heightRatio),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    @objc func handleHumbuger(){
        view.addSubview(sideMenu)
        sideMenu.frame = view.frame
        sideMenu.openSideMenu()
    }
    
    @objc func openIntroduction() {
        print("introductionTapped")
        let controller = IntroductionController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func openDiagnosesAlbums() {
        print("DiagnosesTapped")
        let controller = DashboardController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func openQuizme() {
        print("Quiz me tapped")
    }
    @objc func openContactUs() {
        print("contact us tapped")
    }
}
