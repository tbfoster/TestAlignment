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
    
    //**************************************************************************
    func resize(hAlign: alignHorizontol, vWidth: CGFloat, vHeight: CGFloat, vSubX: UIView, vSubY: UIView)
    {
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        addAllConstraints(hAlign: hAlign, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
        self.layoutIfNeeded()
        self.updateMask()
    }
    //**************************************************************************
    func initView()
    {
        self.layer.cornerRadius = 2.0
        self.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.normalTextColor = UIColor.blue // UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        self.maskedTextColor = UIColor.white
        
        self.container.layer.borderWidth = 3.0
        self.container.layer.borderColor = UIColor.gray.cgColor
        self.container.backgroundColor = UIColor.white
        self.container.layer.cornerRadius = 8.0
        self.container.clipsToBounds = true
        
        self.progressBar.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.8, alpha: 1)
        
        self.progressLabel.font = UIFont.boldSystemFont(ofSize: 32)
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
    }
    func alignWithVisualFormat(vView: UIView, vFormat: String)-> [NSLayoutConstraint]
    {
        return NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: [], metrics: nil, views: allSubViews)
    }
    //**********************************************************
    func alignWithVisualFormat2(vView: UIView, vFormat: String)
    {
        let visualConstraints = NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: [], metrics: nil, views: allSubViews)
        for vConstraint in visualConstraints
        {
            data.landscapeConstraints.append(vConstraint)
        }
//        return NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: [], metrics: nil, views: allSubViews)
    }
    //**************************************************************************
    func addAllConstraints(hAlign: alignHorizontol, vWidth: CGFloat, vHeight: CGFloat, vSubX: UIView, vSubY: UIView)
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
            print("Center")
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .centerX, relatedBy: .equal, toItem: vSubX,   attribute: .centerX,        multiplier: 1, constant: 0),
                          NSLayoutConstraint(item: self.container, attribute: .top,     relatedBy: .equal, toItem: vSubY, attribute: .bottom,         multiplier: 1, constant: 1),
                          NSLayoutConstraint(item: self.container, attribute: .width,   relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cWidth),
                          NSLayoutConstraint(item: self.container, attribute: .height,  relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cHeight)
            ]
            NSLayoutConstraint.activate(vAlign)
            break
        case .leftEven:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .left,   relatedBy: .equal, toItem: vSubX, attribute: .left,           multiplier: 1, constant: 0),
                          NSLayoutConstraint(item: self.container, attribute: .top,    relatedBy: .equal, toItem: vSubY, attribute: .bottom,         multiplier: 1, constant: 1),
                          NSLayoutConstraint(item: self.container, attribute: .width,  relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cWidth),
                          NSLayoutConstraint(item: self.container, attribute: .height, relatedBy: .equal, toItem: nil,   attribute: .notAnAttribute, multiplier: 1, constant: cHeight)
            ]
            NSLayoutConstraint.activate(vAlign)
            break
        case .rightOf:
            let vAlign = [NSLayoutConstraint(item: self.container, attribute: .leading, relatedBy: .equal, toItem: vSubX, attribute: .trailing, multiplier: 1, constant: 1),
                          NSLayoutConstraint(item: self.container, attribute: .top,    relatedBy: .equal,  toItem: vSubY,  attribute: .bottom,         multiplier: 1, constant: 1),
                          NSLayoutConstraint(item: self.container, attribute: .width,  relatedBy: .equal,  toItem: nil,    attribute: .notAnAttribute, multiplier: 1, constant: cWidth),
                          NSLayoutConstraint(item: self.container, attribute: .height, relatedBy: .equal,  toItem: nil,    attribute: .notAnAttribute, multiplier: 1, constant: cHeight)
            ]
            NSLayoutConstraint.activate(vAlign)
            break
        default:
            break
        }
        
//
//        // ProgressBar constraint
//        alignWithVisualFormat(vView: self.container, vFormat: "H:|[progressBar]")
//        progressBarWidthConstraint = NSLayoutConstraint(item: self.progressBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
//        data.landscapeConstraints.append(progressBarWidthConstraint)
//        alignWithVisualFormat(vView: self.container, vFormat: "V:|[progressBar]|")
//
//        // ProgressLabel Constraint
//        alignWithVisualFormat(vView: self.container, vFormat: "H:|[progressLabel]|")
//        alignWithVisualFormat(vView: self.container, vFormat: "V:|[progressLabel]|")
//        // MaskProgressLabel Constraint
//        alignWithVisualFormat(vView: self.container, vFormat: "H:|[maskedProgressLabel]|")
//        alignWithVisualFormat(vView: self.container, vFormat: "V:|[maskedProgressLabel]|")
//        // View Mask
//        alignWithVisualFormat(vView: self.container, vFormat: "H:|[viewMask]")
//        alignWithVisualFormat(vView: self.container, vFormat: "V:|[viewMask]|")
//        // Progress Bar Width Constraint
//        progressBarMaskWidthConstraint = NSLayoutConstraint(item: self.viewMask, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
//        data.landscapeConstraints.append(NSLayoutConstraint(item: self.viewMask, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0))
        
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
        self.progressLabel.text = "Shields \(percentage)"
        self.maskedProgressLabel.text = "Shields \(percentage)"
        
        progressBarWidthConstraint.constant = vProgress * (self.container.bounds.size.width - 10)
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
