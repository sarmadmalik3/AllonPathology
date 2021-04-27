//
//  TabbarController.swift
//  GUM
//
//  Created by Malik Farhan Asim on 27/03/2021.
//

import UIKit

class TabbarController: UITabBarController {

    let centerButton = UIButton(type: .custom)
    
    let logoImage = ImageView(imageName: "tabbarBottomLogo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .label
        initViewControllers()
        self.selectedIndex = 1
        
        self.addCenterButton(withImage: logoImage.image!, highlightImage: logoImage.image!)
    }
    
    private func initViewControllers(){
        viewControllers = [
            createNavController(for: PlayerViewController(), title: "Player", image: UIImage(named: "music")!),
            createNavController(for: HomeViewController(), title: "Home", image: UIImage()),
            createNavController(for: ProfileViewController(), title: "Profile", image: UIImage(named: "profile")!),
        ]
    }

    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
//        navController.navigationItem.title = title
        navController.navigationItem.setHidesBackButton(true, animated: false)
        return navController
    }
    func addCenterButton(withImage buttonImage : UIImage, highlightImage: UIImage) {

//        self.centerButton.autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        self.centerButton.frame = CGRect(x: 0.0, y: 0.0, width: buttonImage.size.width, height: buttonImage.size.height)
        
        self.centerButton.setBackgroundImage(buttonImage, for: .normal)
        self.centerButton.setBackgroundImage(highlightImage, for: .highlighted)
        self.centerButton.isUserInteractionEnabled = true

//        let heightdif: CGFloat = Int(buttonImage.size.height).heightRatio - (self.tabBar.frame.size.height);

//        if (heightdif < 0){
//            self.centerButton.center = (self.tabBar.center)
//        }
//        else{
//            var center: CGPoint = (self.tabBar.center)
//            center.y = center.y - 45.heightRatio
//            self.centerButton.center = center
//        }

        self.view.addSubview(self.centerButton)
        self.tabBar.bringSubviewToFront(self.centerButton)
        NSLayoutConstraint.activate([
            centerButton.heightAnchor.constraint(equalToConstant: 76),
            centerButton.widthAnchor.constraint(equalTo: centerButton.heightAnchor),
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])

        self.centerButton.addTarget(self, action: #selector(handleTouchTabbarCenter), for: .touchUpInside)

        if let count = self.tabBar.items?.count
        {
            let i = floor(Double(count / 2))
            let item = self.tabBar.items![Int(i)]
            item.title = ""
        }
    }
   @objc func handleTouchTabbarCenter()
   {
       if let count = self.tabBar.items?.count
       {
           let i = floor(Double(count / 2))
           self.selectedViewController = self.viewControllers?[Int(i)]
       }
   }
}
