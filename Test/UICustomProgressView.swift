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
    //var containerHeightPadding: NSArray
    //var containerWidthPadding: NSArray
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
    
    init()
    {
        super.init(frame: CGRect(x: 100, y: 100, width: 300, height: 200))
        initView()
        addAllConstraints()
    }
    //**************************************************************************
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        print("Frame: \(frame)")
//        initView()
//        addAllConstraints()
//    }
    //**************************************************************************
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //**************************************************************************
    func initView()
    {
        self.layer.cornerRadius = 2.0
        self.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        
        self.container.layer.borderWidth = 1.0
        self.container.layer.borderColor = UIColor.gray.cgColor
        self.container.backgroundColor = UIColor.white
        self.normalTextColor = UIColor.black
        self.maskedTextColor = UIColor.white
        
        self.container.layer.cornerRadius = 3.0
        self.container.clipsToBounds = true
        
        self.progressBar.backgroundColor = UIColor.blue
        
        
        self.progressLabel.font = UIFont.boldSystemFont(ofSize: 32)
        self.progressLabel.textAlignment = .center
        self.progressLabel.textColor = self.normalTextColor
        self.progressLabel.clipsToBounds = true
        self.progressLabel.text = "Test Me"
        
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
    //**********************************************************
    func alignWithVisualFormat(vView: UIView, vName: String, vFormat: String)-> [NSLayoutConstraint]
    {
        return NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: [], metrics: nil, views: allSubViews)
    }
    //**************************************************************************
    func addAllConstraints()
    {
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.maskedProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mask?.translatesAutoresizingMaskIntoConstraints = false
        
        // container constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vName: "container", vFormat: "H:|-5-[container]-5-|"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.container, vName: "container", vFormat: "V:|-5-[container]-5-|"))

        // progressBar constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.progressBar, vName: "progressBar", vFormat: "H:|[progressBar]"))
        NSLayoutConstraint.activate([NSLayoutConstraint(item: self.progressBar, attribute: .height, relatedBy: .equal, toItem: self.container, attribute: .height, multiplier: 10.0, constant: 0)])
        
        progressBarWidthConstraint = NSLayoutConstraint(item: self.progressBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
        NSLayoutConstraint.activate([progressBarWidthConstraint])
        
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.progressBar, vName: "progressBar", vFormat: "V:|[progressBar]"))
        
        // ProgressLabel Constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.progressLabel, vName: "progressLabel", vFormat: "H:|-5-[progressLabel]-5-|"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.progressLabel, vName: "progressLabel", vFormat: "V:|-2-[progressLabel]-2-|"))
        
        // MaskProgressLabel Constraint
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.maskedProgressLabel, vName: "maskedProgressLabel", vFormat: "H:|-5-[maskedProgressLabel]-5-|"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.maskedProgressLabel, vName: "maskedProgressLabel", vFormat: "V:|-2-[maskedProgressLabel]-2-|"))
        
        // View Mask
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.viewMask, vName: "viewMask", vFormat: "H:|[viewMask]"))
        NSLayoutConstraint.activate(alignWithVisualFormat(vView: self.viewMask, vName: "viewMask", vFormat: "V:|[viewMask]"))
        
        progressBarMaskWidthConstraint = NSLayoutConstraint(item: self.viewMask, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 10.0, constant:0)
        //NSLayoutConstraint.activate([progressBarMaskWidthConstraint])
    }
    //**************************************************************************
    func setProgress(vProgress: CGFloat)
    {
        let percentage = vProgress * 100
        self.progressLabel.text = "\(percentage)"
        self.maskedProgressLabel.text = "\(percentage)"
        progressBarWidthConstraint.constant = vProgress * (self.bounds.size.width - 10)
        progressBarMaskWidthConstraint.constant = progressBarWidthConstraint.constant
        
        self.layoutIfNeeded()
        self.updateMask()
    }
    //**************************************************************************
    func updateMask()
    {
        let maskRect = CGRect(x: 0, y: 0, width: progressBarMaskWidthConstraint.constant, height: self.viewMask.bounds.size.height)
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = maskRect
        
        self.viewMask.layer.mask = maskLayer
        
        
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        CGRect maskRect = CGRectMake(0, 0, progressBarMaskWidthConstraint.constant, self.mask.bounds.size.height);
//
//        CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
//
//        maskLayer.path = path;
//
//        CGPathRelease(path);
//
//        self.maskedProgressLabel.layer.mask = maskLayer;
        
    }
    //**************************************************************************
    func setFullScreen()
    {
//        self.layer.cornerRadius = 0.0f;
//        self.backgroundColor = nil;
//
//        self.container.layer.cornerRadius = 0.0f;
//
//        @autoreleasepool {
//            [self removeConstraints:containerHeightPadding];
//            [self removeConstraints:containerWidthPadding];
//
//            id views = @{@"container": self.container, @"progressBar": self.progressBar, @"progressLabel": self.progressLabel, @"maskedProgressLabel": self.maskedProgressLabel, @"mask": self.mask};
//            containerHeightPadding = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[container]-1-|" options:0 metrics:nil views:views];
//            containerWidthPadding = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[container]-1-|" options:0 metrics:nil views:views];
//            [self addConstraints:containerHeightPadding];
//            [self addConstraints:containerWidthPadding];
//        }
//
//        progressBarWidthConstraint.constant = self.progress * self.bounds.size.width;
//        progressBarMaskWidthConstraint.constant = progressBarWidthConstraint.constant;
//
//        [self layoutIfNeeded];
//
//        [self updateMask];
    }
    //**************************************************************************
    func setContainerBackgroundColor(vColor: UIColor)
    {
        self.container.backgroundColor = backgroundColor
//        @autoreleasepool {
//            CGFloat r;
//            CGFloat g;
//            CGFloat b;
//            CGFloat a;
//            [self.container.backgroundColor getRed:&r green:&g blue:&b alpha:&a];
//            if (r > 0.6f || g > 0.6f || b > 0.6f) {
//                self.normalTextColor = [UIColor blackColor];
//            } else {
//                self.normalTextColor = [UIColor whiteColor];
//            }
//        }
    }
    //**************************************************************************
    func setProgressFillColor(vColor: UIColor)
    {
        self.progressBar.backgroundColor = vColor
//        @autoreleasepool {
//            CGFloat r;
//            CGFloat g;
//            CGFloat b;
//            CGFloat a;
//            [self.progressBar.backgroundColor getRed:&r green:&g blue:&b alpha:&a];
//            if (r > 0.6f || g > 0.6f || b > 0.6f) {
//                self.maskedTextColor = [UIColor blackColor];
//            } else {
//                self.maskedTextColor = [UIColor whiteColor];
//            }
//        }
    }
    //**************************************************************************
}
