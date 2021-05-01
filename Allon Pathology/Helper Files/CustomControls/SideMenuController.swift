//
//  SideMenuController.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit

class SideMenu: UIView {
    
    //MARK:-UI-Elements
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let menuView : UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bgImage = ImageView(imageName: "sidemenu_bg")
    let backArrow = ImageView(imageName: "backArrow")
    let logo = ImageView(imageName: "logo_sidemenu")
    let mainMenuLabel = Label(text: "Main Menu", textColor: #colorLiteral(red: 0.1176470588, green: 0.3764705882, blue: 0.5960784314, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold, fontSize: 18), alingment: .left)
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK:-Properties
        var menuArray = [sideMenu]()
        static var selectedIndex = 0
    //MARK:-Cell Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        containerView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeMenu))
        containerView.addGestureRecognizer(tap)
        createSideMenu()
        fillSideMenu()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-Helper Methods
    func createSideMenu(){
        addSubview(containerView)
        containerView.addSubview(menuView)
        menuView.addSubview(bgImage)
        menuView.addSubview(backArrow)
        menuView.addSubview(logo)
        menuView.addSubview(mainMenuLabel)
        menuView.addSubview(lineView)
        menuView.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            menuView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor ,constant: -106.widthRatio),
            menuView.topAnchor.constraint(equalTo: containerView.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            bgImage.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            bgImage.topAnchor.constraint(equalTo: menuView.topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
            
            backArrow.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 20.widthRatio),
            backArrow.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 64.heightRatio),
            backArrow.widthAnchor.constraint(equalToConstant: 40.widthRatio),
            backArrow.heightAnchor.constraint(equalTo: backArrow.widthAnchor),
            
            logo.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 65.heightRatio),
            logo.widthAnchor.constraint(equalToConstant: 80.widthRatio),
            logo.heightAnchor.constraint(equalToConstant: 50.heightRatio),
            
            mainMenuLabel.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 30.widthRatio),
            mainMenuLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 49.heightRatio),
            
            lineView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -30),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.topAnchor.constraint(equalTo: mainMenuLabel.bottomAnchor, constant: 10.heightRatio),
            
            tableView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20.heightRatio),
            tableView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
        ])
    }
    
    func openSideMenu(){
        createSideMenu()
        containerView.addSubview(menuView)
        menuView.transform = CGAffineTransform(translationX:  -self.frame.maxX , y: 0)
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = CGAffineTransform(translationX: (self?.frame.minX)! , y: 0)
            self?.containerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        }

    }
     func closeSideMenu(){
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = CGAffineTransform(translationX: -(self?.frame.maxX)! , y: 0)
            self?.containerView.backgroundColor = .clear
        }completion: { [weak self] (hide) in
            if hide {
                self?.removeFromSuperview()
            }
        }
    }
    
    @objc func closeMenu(){
        closeSideMenu()
    }
    
    func fillSideMenu(){
        let object1 = sideMenu(name: "Introduction", image: "introduction")
        let object2 = sideMenu(name: "Diagnoses Albums", image: "search-1")
        let object3 = sideMenu(name: "Quiz Me", image: "quiz")
        let object4 = sideMenu(name: "Contact Us", image: "contactus")
        menuArray.append(object1)
        menuArray.append(object2)
        menuArray.append(object3)
        menuArray.append(object4)
        tableView.reloadData()
    }
}
extension SideMenu : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuCell
        if indexPath.row == SideMenu.selectedIndex {
            cell.selectedCell()
        }else{
            cell.unselectedCell()
        }
        cell.menuImage.image = UIImage(named: menuArray[indexPath.row].image)
        cell.menuTitle.text = menuArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.heightRatio
    }
    
    
}

struct sideMenu {
    var name = ""
    var image = ""
}
