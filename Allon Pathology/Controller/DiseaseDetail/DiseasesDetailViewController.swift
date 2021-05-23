//
//  DiseasesDetailViewController.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 11/05/2021.
//

import UIKit
import ImageScrollView

class DiseasesDetailViewController: ParentController , UIGestureRecognizerDelegate{

    //MARK:-UI-Elements
    let diseasesImage = ImageView(imageName: "")
    let containerView : UIView = {
        let view = UIView()
        view.dropShadow()
        view.layer.cornerRadius = 10.autoSized
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let textView : UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isSelectable = true
        tv.font = .setFont(fontName: .Poppins_Regular, fontSize: 16.autoSized)
        tv.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tv.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    //MARK:-Properties
    let imageScrollView : ImageScrollView = {
        let view = ImageScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let scrollContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK:-ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        diseasesImage.layer.cornerRadius = 10.autoSized
        humburger.image = UIImage(named: "arrow_back")
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapeHandler))
        diseasesImage.isUserInteractionEnabled = true
        diseasesImage.addGestureRecognizer(tap)
        imageScrollView.setup()
        imageScrollView.imageScrollViewDelegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScrollContainerView))
        scrollContainerView.isUserInteractionEnabled = true
        tapGesture.delegate = self
        scrollContainerView.addGestureRecognizer(tapGesture)
   
    }

    override func setupViews() {
        super.setupViews()
        view.addSubview(containerView)
        containerView.addSubview(diseasesImage)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.widthRatio),
            containerView.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: -20.heightRatio),
            containerView.heightAnchor.constraint(equalToConstant: 165.heightRatio),
            
            diseasesImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            diseasesImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            diseasesImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            diseasesImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.heightRatio),
            textView.topAnchor.constraint(equalTo: diseasesImage.bottomAnchor, constant: 20.widthRatio),
        
        ])
    }
    override func handleHumbuger() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func imageTapeHandler(){
        
        view.addSubview(scrollContainerView)
        scrollContainerView.frame = view.frame
        scrollContainerView.addSubview(imageScrollView)
        imageScrollView.frame = view.frame
        imageScrollView.display(image: diseasesImage.image!)
    }
    
    @objc func handleScrollContainerView(){
        scrollContainerView.removeFromSuperview()
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view!.isDescendant(of: imageScrollView.zoomView!) {
            return false
        }else{
            return true
        }
        
        
    }
}
extension DiseasesDetailViewController :ImageScrollViewDelegate {
    func imageScrollViewDidChangeOrientation(imageScrollView: ImageScrollView) {
        print("Did change orientation")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming at scale \(scale)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
    }
}
