//
//  ParentController.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit
import JGProgressHUD

class ParentController: UIViewController  , UITextFieldDelegate{

    let navbg_image = ImageView(imageName: "navbarImage")
    let humburger = ImageView(imageName: "hamburger")
    let logo = ImageView(imageName: "logo_sidemenu")
    let bottomSideImage = ImageView(imageName: "atom_icon")
    let noDataFoundLabel = Label(text: "No Data Found", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_Medium , fontSize: 20), alingment: .center)

    let sideMenu = SideMenu()
    lazy var progressHud : JGProgressHUD = {
        let progress = JGProgressHUD()
        progress.textLabel.text = "Loading"
        progress.style = .light
        return progress
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        noDataFoundLabel.alpha = 0
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
        view.addSubview(logo)
        view.addSubview(bottomSideImage)
        view.addSubview(noDataFoundLabel)
        NSLayoutConstraint.activate([
            navbg_image.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: -48.widthRatio),
            navbg_image.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 48.widthRatio),
            navbg_image.topAnchor.constraint(equalTo: view.topAnchor , constant:  -50.heightRatio),
            navbg_image.heightAnchor.constraint(equalToConstant: 227.heightRatio),
            
            humburger.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            humburger.heightAnchor.constraint(equalTo: humburger.widthAnchor),
            humburger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            humburger.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.heightRatio),
            
            logo.widthAnchor.constraint(equalToConstant: 80.autoSized),
            logo.heightAnchor.constraint(equalToConstant: 50.autoSized),
            logo.centerYAnchor.constraint(equalTo: humburger.centerYAnchor),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomSideImage.widthAnchor.constraint(equalToConstant: 292.widthRatio),
            bottomSideImage.heightAnchor.constraint(equalToConstant: 286.heightRatio),
            bottomSideImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 120.widthRatio),
            bottomSideImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50.heightRatio),
            noDataFoundLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noDataFoundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func showProgressHud(){
        progressHud.show(in: self.view, animated: true)
    }
    
    func dissmissProgressHud(){
        progressHud.dismiss()
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
        let controller = QuizCategoryController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func openContactUs() {
        let email = "allonpathology@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}
