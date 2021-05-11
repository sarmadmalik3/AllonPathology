//
//  CustomImageView.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 11/05/2021.
//

import UIKit

class CustomImageView: UIImageView , UIScrollViewDelegate{
//    var bgView =  UIScrollView()
    lazy var bgView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentSize = CGSize(width: self.frame.size.width, height: frame.size.height)
        v.showsVerticalScrollIndicator = false
        return v
    }()
    var zoomable_ImageView = UIImageView()
    var animated: Bool = true
    
    //MARK: Life cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    public static func screenWidth()->CGFloat{
        var width: CGFloat = 0
        if let window = UIApplication.shared.keyWindow{
            width = window.frame.width
        }
        return width
    }
    public static func screenHeight()->CGFloat{
        var height: CGFloat = 0
        if let window = UIApplication.shared.keyWindow{
            height = window.frame.height
        }
        return height
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTapGesture()
        bgView.delegate = self
        bgView.minimumZoomScale = 1.0
        bgView.maximumZoomScale = 10.0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTapGesture()
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.fullScreenMe))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    //MARK: Actions of Gestures
   @objc func exitFullScreen () {
        bgView.removeFromSuperview()
    }

   @objc func fullScreenMe() {

        if let window = UIApplication.shared.delegate?.window {
            bgView = UIScrollView(frame: UIScreen.main.bounds)
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.exitFullScreen)))
            bgView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
             zoomable_ImageView = UIImageView(image: self.image)
            zoomable_ImageView.frame = bgView.frame
            zoomable_ImageView.contentMode = .scaleAspectFit
            zoomable_ImageView.enableZoom()
            self.bgView.addSubview(zoomable_ImageView)
            window?.addSubview(bgView)
            
            if animated {
                var sx:CGFloat=0, sy:CGFloat=0
                if self.frame.size.width > self.frame.size.height {
                    sx = self.frame.size.width/zoomable_ImageView.frame.size.width
                    zoomable_ImageView.transform = CGAffineTransform(scaleX: sx, y: sx)
                }else{
                    sy = self.frame.size.height/zoomable_ImageView.frame.size.height
                    zoomable_ImageView.transform = CGAffineTransform(scaleX: sy, y: sy)
                }
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    self.zoomable_ImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            }
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
       return zoomable_ImageView
    }
}
