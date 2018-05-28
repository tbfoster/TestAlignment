import UIKit
import Foundation

//**************************************************************************

class ProgressBar: UIView
{
    var uid = UIDesigner()
    
    var containerHeightPadding = NSArray()
    var containerWidthPadding = NSArray()
    var progressBarWidthConstraint = NSLayoutConstraint()
    var progressBarMaskWidthConstraint = NSLayoutConstraint()
    
    var progress: CGFloat = 0
    var normalTextColor = UIColor()
    var maskedTextColor = UIColor()
    var container = UIView()
    var progressBar = UIView()
    var progressLabel = UILabel()
    var maskedProgressLabel = UILabel()
    var allSubViews = [String : UIView]()
    var viewMask = UIView()
    
    //**************************************************************************
    func initView(vView: UIView)
    {
        uid.initView(vView: vView, vGroupTag: 2000)
        
        self.layer.cornerRadius = 2.0
        self.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.normalTextColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        self.maskedTextColor = UIColor.white
        
        self.container.layer.borderWidth = 3.0
        self.container.layer.borderColor = UIColor.gray.cgColor
        self.container.backgroundColor = UIColor.clear
        self.container.layer.cornerRadius = 8.0
        //self.container.clipsToBounds = true
        
        //self.progressBar.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.8, alpha: 1)
        
        self.progressLabel.text = "This is a biggest test"
        self.progressLabel.font = UIFont.boldSystemFont(ofSize: 32)
        self.progressLabel.textAlignment = .center
        self.progressLabel.textColor = UIColor.green
        //self.progressLabel.clipsToBounds = true
        
        self.maskedProgressLabel.text = "TESTING"
        self.maskedProgressLabel.font = self.progressLabel.font
        self.maskedProgressLabel.textAlignment = self.progressLabel.textAlignment
        self.maskedProgressLabel.textColor = UIColor.blue
        //self.maskedProgressLabel.clipsToBounds = true
        
        //self.container.addSubview(self.progressBar)
        //self.container.addSubview(self.progressLabel)
        //self.container.addSubview(self.maskedProgressLabel)
        //self.container.addSubview(self.viewMask)
        self.addSubview(self.container)
        self.addSubview(self.progressLabel)
        self.addSubview(self.maskedProgressLabel)
    }
    //**************************************************************************
    func addAllConstraints()
    {
        self.container.translatesAutoresizingMaskIntoConstraints = false
//        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.maskedProgressLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.viewMask.translatesAutoresizingMaskIntoConstraints = false
        
        uid.align(vView: progressLabel,       horz: .center, vert: .belowInside, widthPct: 0, heightPct: 0, subX: self, subY: self)
        uid.align(vView: maskedProgressLabel, horz: .center, vert: .belowInside, widthPct: 0, heightPct: 0, subX: self, subY: self)
        
//        sendSubview(toBack: self.container)
//        progressLabel.bringSubview(toFront: self.progressLabel)
    }
    //**************************************************************************
    func setProgress(vProgress: CGFloat)
    {
        let percentage = vProgress * 100
        self.progressLabel.text = "XXShields \(percentage)"
        self.maskedProgressLabel.text = "XyShields \(percentage)"
        progressBarWidthConstraint.constant = vProgress * (self.bounds.size.width - 10)
        progressBarMaskWidthConstraint.constant = progressBarWidthConstraint.constant
        
        self.layoutIfNeeded()
        self.updateMask()
    }
    //**************************************************************************
    func updateMask()
    {
        let path = CGPath(rect: CGRect(x: 0, y: 0, width: progressBarMaskWidthConstraint.constant, height: self.viewMask.bounds.size.height), transform: nil)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path
        self.maskedProgressLabel.layer.mask = maskLayer
    }
    //**************************************************************************
}
