//
//  UICustomProgressView.swift
//  SG6
//
//  Created by terrybfoster on 5/27/18.
//  Copyright © 2018 terrybfoster. All rights reserved.
//

import UIKit
import Foundation

//**************************************************************************

class UICustomProgressView: UIView
{
    var data = Data.sharedInstance
    
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
    
    var desc: String = ""
    //**************************************************************************
    func resize(hAlign: alignHorizontol, vAlign: alignVertical, vWidth: CGFloat, vHeight: CGFloat, vSubX: UIView, vSubY: UIView)
    {
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        addAllConstraints(hAlign: hAlign, vAlign: vAlign, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
        self.layoutIfNeeded()
        self.updateMask()
    }
    //**************************************************************************
    func initView(vSuperview: UIView, vDesc: String, vBackground: UIColor, vBorder: UIColor, vNormal: UIColor, vMasked: UIColor, vShade: UIColor, vFont: UIFont, vImage: String?)
    {
        desc = vDesc
        self.layer.cornerRadius = 2.0
        self.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.normalTextColor = vNormal //UIColor.blue // UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        self.maskedTextColor = vMasked //UIColor.white
        
        self.container.layer.borderWidth = 3.0
        self.container.layer.borderColor = vBorder.cgColor
        self.container.backgroundColor = vBackground //UIColor.white
        self.container.layer.cornerRadius = 8.0
        self.container.clipsToBounds = true
        
        if(vImage == nil)
        {
            self.progressBar.backgroundColor = vShade //UIColor(red: 0.2, green: 0.3, blue: 0.8, alpha: 1)
        }
        else
        {
            self.progressBar.backgroundColor = UIColor(patternImage: UIImage(named: vImage!)!)
        }
        
        self.progressLabel.font = vFont //UIFont.boldSystemFont(ofSize: 32)
        self.progressLabel.textAlignment = .center
        self.progressLabel.textColor = self.normalTextColor
        self.progressLabel.clipsToBounds = true
        
        self.maskedProgressLabel.font = self.progressLabel.font
        self.maskedProgressLabel.textAlignment = self.progressLabel.textAlignment
        self.maskedProgressLabel.textColor = self.maskedTextColor
        self.maskedProgressLabel.clipsToBounds = true
        
        self.container.addSubview(self.progressBar)
        self.container.addSubview(self.progressLabel)
        self.container.addSubview(self.maskedProgressLabel)
        self.container.addSubview(self.viewMask)
        
        self.addSubview(self.container)
        
        allSubViews["container"] = self.container
        allSubViews["progressBar"] = self.progressBar
        allSubViews["progressLabel"] = self.progressLabel
        allSubViews["maskedProgressLabel"] = self.maskedProgressLabel
        allSubViews["viewMask"] = self.viewMask
        vSuperview.addSubview(self)
    }
    //**************************************************************************
    func alignWithVisualFormat(vView: UIView, vFormat: String)-> [NSLayoutConstraint]
    {
        return NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: [], metrics: nil, views: allSubViews)
    }
    //**************************************************************************
    func addAllConstraints(hAlign: alignHorizontol, vAlign: alignVertical, vWidth: CGFloat, vHeight: CGFloat, vSubX: UIView, vSubY: UIView)
    {
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.maskedProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.viewMask.translatesAutoresizingMaskIntoConstraints = false
        
        let cWidth = vWidth * data.portraitScreenWidth
        let cHeight = vHeight * data.portraitScreenHeight
        
        switch hAlign {
        case .center:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .centerX, relatedBy: .equal, toItem: vSubX,   attribute: .centerX,        multiplier: 1, constant: 0)]
            NSLayoutConstraint.activate(vAlign)
            break
        case .leftEven:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .left,   relatedBy: .equal, toItem: vSubX, attribute: .left,           multiplier: 1, constant: 0)]
            NSLayoutConstraint.activate(vAlign)
            break
        case .rightOf:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .leading, relatedBy: .equal, toItem: vSubX, attribute: .trailing, multiplier: 1, constant: 0)]
            NSLayoutConstraint.activate(vAlign)
            break
        case .rightInside:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .right, relatedBy: .equal, toItem: vSubX, attribute: .right, multiplier: 1, constant: 0)]
            NSLayoutConstraint.activate(vAlign)
            break
        default:
            break
        }
        
        switch(vAlign)
        {
        case .below:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .top, relatedBy: .equal, toItem: vSubY, attribute: .bottom, multiplier: 1, constant: 1)]
            NSLayoutConstraint.activate(vAlign)
            break
        case .above:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .bottom, relatedBy: .equal, toItem: vSubY, attribute: .top, multiplier: 1, constant: 1)]
            NSLayoutConstraint.activate(vAlign)
            break
        default:
            break
        }
        
        let widthHeight = [NSLayoutConstraint(item: self.container, attribute: .width,   relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cWidth),
                           NSLayoutConstraint(item: self.container, attribute: .height,  relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cHeight)]
        NSLayoutConstraint.activate(widthHeight)
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "H:|[progressBar]"))
        progressBarWidthConstraint = NSLayoutConstraint(item: self.progressBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
        NSLayoutConstraint.activate([progressBarWidthConstraint])
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "V:|[progressBar]|"))

        // ProgressLabel Constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "H:|[progressLabel]|"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "V:|[progressLabel]|"))

        // MaskProgressLabel Constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "H:|[maskedProgressLabel]|"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "V:|[maskedProgressLabel]|"))

        // View Mask
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "H:|[viewMask]"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vFormat: "V:|[viewMask]|"))

        progressBarMaskWidthConstraint = NSLayoutConstraint(item: self.viewMask, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
        NSLayoutConstraint.activate([progressBarMaskWidthConstraint])
    }
    //**************************************************************************
    func setProgress(vProgress: CGFloat)
    {
        let percentage = vProgress * 100
        self.progressLabel.text = "\(desc) \(Int(percentage))%"
        self.maskedProgressLabel.text = "\(desc) \(Int(percentage))%"
        
        progressBarWidthConstraint.constant = vProgress * (self.container.bounds.size.width - 1)
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
