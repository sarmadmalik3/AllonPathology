//
//  Extension.swift
//  GUM
//
//  Created by Malik Farhan Asim on 25/03/2021.
//

import Foundation
import UIKit
import SDWebImage

enum fontName : String {
   case Poppins_Light = "Poppins-Light"
   case Poppins_Medium = "Poppins-Medium"
   case Poppins_Regular = "Poppins-Regular"
   case Poppins_Bold = "Poppins-Bold"
   case Poppins_SemiBold = "Poppins-SemiBold"
}

extension UIFont {

   static func setFont(fontName: fontName , fontSize: CGFloat) -> UIFont {
        
        let font = UIFont(name: fontName.rawValue, size: fontSize)!
        return font
    }
}
extension Int{
    var autoSized : CGFloat{
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/894*100 //894 is the diagonal size of iphone xs / 11pro
        return diagonalSize * percentage / 100
    }
    
    var widthRatio: CGFloat {
        let width = UIScreen.main.bounds.width/375.0 //iphone 11 pro
        return CGFloat(self)*width
    }
    var heightRatio: CGFloat {
        let width = UIScreen.main.bounds.height/812.0 //iphone 11 pro
        return CGFloat(self)*width
    }
}

extension UICollectionViewCell {
    func shadowDecorate() {

        self.layer.cornerRadius = 10.autoSized
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
        
    }
}

extension UIImageView{
    func downloadImage(url:String){
      //remove space if a url contains.
        let stringWithoutWhitespace = url.replacingOccurrences(of: " ", with: "%20", options: .regularExpression)
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
//        self.sd_setImage(with: URL(string: stringWithoutWhitespace), placeholderImage: UIImage())
        self.sd_setImage(with: URL(string: stringWithoutWhitespace), placeholderImage: UIImage(), options: [.progressiveLoad , .highPriority], progress: nil, completed: nil)
    }
}

extension UIView {
    
    func insertNavbarView() -> navbarView {
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
       let view = navbarView()
       let logo = ImageView(imageName: "logo")
       view.translatesAutoresizingMaskIntoConstraints = false
    
        self.addSubview(view)
        addSubview(atom)
        addSubview(titleImage)
//        addSubview(humburger)
        addSubview(logo)
        titleImage.addSubview(containerView)
        containerView.addSubview(titlelabel)
        containerView.addSubview(docNameLabel)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor , constant: -45.heightRatio),
            view.heightAnchor.constraint(equalToConstant: 340.heightRatio),
            
            titleImage.heightAnchor.constraint(equalToConstant: 150.heightRatio),
            titleImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -38.widthRatio),
            titleImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.widthRatio),
            
            titleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40.heightRatio),
            
            atom.widthAnchor.constraint(equalTo: atom.heightAnchor),
            atom.heightAnchor.constraint(equalToConstant: 170.heightRatio),
            atom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35.heightRatio),
            atom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 35.widthRatio),
            
            containerView.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.widthRatio),
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
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 55.heightRatio),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
        return view
    }
    
    
    func rotate(degrees: CGFloat) {

        let degreesToRadians: (CGFloat) -> CGFloat = { (degrees: CGFloat) in
            return degrees / 180.0 * CGFloat.pi
        }
        self.transform =  CGAffineTransform(rotationAngle: degreesToRadians(degrees))

        // If you like to use layer you can uncomment the following line
        //layer.transform = CATransform3DMakeRotation(degreesToRadians(degrees), 0.0, 0.0, 1.0)
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat){
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
    }
    func dropShadow() {

//        self.layer.cornerRadius = 10.autoSized
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.7
//        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
    }
}
extension UICollectionViewCell {
    func applyShadow() {

        self.layer.cornerRadius = 10.autoSized
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
        
    }
}
extension UILabel {

    // Pass value for any one of both parameters and see result
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}
extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
