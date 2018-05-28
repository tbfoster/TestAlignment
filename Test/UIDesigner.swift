import UIKit

//**********************************************************
enum alignText
{
    case bottom, top, center
}
//**********************************************************
enum alignHorizontol
{
    case
    left, right, center, rightOf, leftOf, leftInside, leftEven, rightInside
}
//**********************************************************
enum alignVertical
{
    case
    top, bottom, center, below, above, aboveInside, belowInside, topMargin
}
//**********************************************************
struct AppColor {
    // Defaults
    static let defaultGame              = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let defaultEnabled           = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let defaultDisabled          = UIColor.red
    static let defaultFrame             = UIColor.lightGray
    
    // Progress Bars
    static let progressText             = UIColor.yellow
    static let progressBackground       = UIColor.black
    static let progressTrack            = UIColor.lightGray
    static let progressTint             = UIColor.blue
    static let repairProgressTrack      = UIColor.lightGray
    static let repairProgressTint       = UIColor.red
    static let waveProgressTrack        = UIColor.lightGray
    static let waveProgressTint         = UIColor.green
    
    // Labels
    static let labelBackground          = UIColor.black
}
//**********************************************************
class UIDesigner
{
    var data = Data.sharedInstance
    
    var view = UIView()
    var font = UIFont()
    var groupTag: Int = 10000
    var screenConstant: CGFloat = 1
    
    //**********************************************************
    func initView(vView: UIView, vGroupTag: Int)
    {
        view = vView
        switch UIDevice.current.userInterfaceIdiom
        {
        case .phone:
            font = UIFont.boldSystemFont(ofSize: 16)
            screenConstant = 5
            break
        case .pad:
            font = UIFont.boldSystemFont(ofSize: 32)
            screenConstant = 5
            break
        case .unspecified:
            screenConstant = 1
            font = UIFont.boldSystemFont(ofSize: 16)
            break
        default:
            break
        }
        groupTag = vGroupTag
    }
    //**********************************************************
    func addLabel(vTitle: String, vAlignText: alignText, vhasFrame: Bool) -> UILabel
    {
        let vLabel = UILabel()
        vLabel.tag = groupTag
        vLabel.text = vTitle
        vLabel.textAlignment = .center
        if(vhasFrame)
        {
            vLabel.layer.cornerRadius = 8
            vLabel.layer.borderWidth = 3
            vLabel.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        vLabel.textColor = AppColor.defaultGame
        vLabel.backgroundColor = UIColor.clear
        
        if(vhasFrame == true)
        {
            vLabel.layer.borderColor = AppColor.defaultFrame.cgColor
            vLabel.layer.borderWidth = 3
            vLabel.layer.cornerRadius = 10
        }
        vLabel.font = font
        vLabel.adjustsFontSizeToFitWidth = true
        vLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vLabel)
        return vLabel
    }
    //**********************************************************
    func addButton(vTitle: String, vAlignText: alignText) -> UIButton
    {
        let vButton = UIButton()
        vButton.tag = groupTag
        vButton.setTitle(vTitle, for: .normal)
        vButton.titleLabel?.font = font
        vButton.setTitleColor(AppColor.defaultGame, for: .normal)
        vButton.setTitleColor(AppColor.defaultDisabled, for: .disabled)
        
        vButton.layer.cornerRadius = 8
        vButton.layer.borderWidth = 3
        vButton.layer.borderColor = AppColor.defaultGame.cgColor
        
        vButton.translatesAutoresizingMaskIntoConstraints = false
        switch(vAlignText)
        {
        case .bottom: vButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom; break
        case .top:    vButton.contentVerticalAlignment = UIControlContentVerticalAlignment.top; break
        case .center: break
        }
        view.addSubview(vButton)
        return vButton
    }
    //**********************************************************
    func addUIView() -> UIView
    {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.borderWidth = 3.0
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 8.0
        view.addSubview(containerView)
        view.sendSubview(toBack: containerView)
        return containerView
    }
    
    //**********************************************************
    func addProgressBar(vProgress: Float) -> ProgressBar
    {
        let vProgressBar = ProgressBar()
        vProgressBar.initView(vView: view)
        vProgressBar.translatesAutoresizingMaskIntoConstraints = false
        vProgressBar.setProgress(vProgress: 0.25)
        view.addSubview(vProgressBar)
        return vProgressBar
    }
    //**********************************************************
    func addProgressView(vProgress: Float) -> UIProgressView
    {
        let vProgressBar = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        vProgressBar.tag = groupTag
        vProgressBar.progressViewStyle = .default
        vProgressBar.trackTintColor = AppColor.progressTrack
        vProgressBar.progressTintColor = AppColor.progressTint
        vProgressBar.translatesAutoresizingMaskIntoConstraints = false
        vProgressBar.setProgress(vProgress, animated: false)
        view.addSubview(vProgressBar)
        return vProgressBar
    }
    //**********************************************************
    func addPageControl(vStartPage: Int, vMaxPages: Int) -> UIPageControl
    {
        let vPageControl = UIPageControl()
        vPageControl.tag = groupTag
        vPageControl.currentPage = vStartPage
        vPageControl.numberOfPages = vMaxPages
        vPageControl.pageIndicatorTintColor = AppColor.defaultGame
        vPageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vPageControl)
        return vPageControl
    }
    //**********************************************************
    // Set both horizontal and vertical layouts
    func align(vView: UIView, horz: alignHorizontol, vert: alignVertical, widthPct: CGFloat, heightPct: CGFloat, subX: UIView?, subY: UIView?)
    {
        landscape(vView: vView, horz: horz, vert: vert, widthPct: widthPct, heightPct: heightPct, subX: subX, subY: subY)
        portrait(vView:  vView, horz: horz, vert: vert, widthPct: widthPct, heightPct: heightPct, subX: subX, subY: subY)
    }
    //**********************************************************
    func landscape(vView: UIView, horz: alignHorizontol, vert: alignVertical, widthPct: CGFloat, heightPct: CGFloat, subX: UIView?, subY: UIView?)
    {
        var constraints: [NSLayoutConstraint] = []
        
        switch horz
        {
        case .left:         constraints.append(alignLeft(vView: vView)); break
        case .right:        constraints.append(alignRight(vView: vView)); break
        case .center:       constraints.append(alignCenterX(vView: vView)); break
        case .rightOf:      constraints.append(alignRightOf(vView: vView,     superView: subX!)); break
        case .rightInside:  constraints.append(alignRightInside(vView: vView, superView: subX!)); break
        case .leftOf:       constraints.append(alignLeftOf(vView: vView,      superView: subX!)); break
        case .leftInside:   constraints.append(alignLeftInside(vView: vView,  superView: subX!)); break
        case .leftEven:     constraints.append(alignLeftEven(vView: vView,    superView: subX!)); break
        }
        
        switch vert
        {
        case .top:          constraints.append(alignTop(vView: vView)); break
        case .topMargin:    constraints.append(alignTopMargin(vView: vView)); break
        case .bottom:       constraints.append(alignBottom(vView: vView)); break
        case .center:       constraints.append(alignCenterY(vView: vView)); break
        case .above:        constraints.append(alignAbove(vView: vView,       superView: subY!)); break
        case .aboveInside:  constraints.append(alignAboveInside(vView: vView, superView: subY!)); break
        case .belowInside:  constraints.append(alignBelowInside(vView: vView, superView: subY!)); break
        case .below:        constraints.append(alignBelow(vView: vView,       superView: subY!)); break
        }
        
        if(widthPct != 0)
        {
            constraints.append(alignSetWidth(vView: vView, vConstantWidth: widthPct * data.landscapeScreenWidth))
        }
        
        if(heightPct != 0)
        {
            constraints.append(alignSetHeight(vView: vView, vConstantHeight: heightPct * data.landscapeScreenHeight))
        }
        
        for vConstraint in constraints
        {
            data.landscapeConstraints.append(vConstraint)
        }
    }
    //**********************************************************
    func portrait(vView: UIView, horz: alignHorizontol, vert: alignVertical, widthPct: CGFloat, heightPct: CGFloat, subX: UIView?, subY: UIView?)
    {
        var constraints: [NSLayoutConstraint] = []
        
        switch horz
        {
        case .left:         constraints.append(alignLeft(vView: vView)); break
        case .right:        constraints.append(alignRight(vView: vView)); break
        case .center:       constraints.append(alignCenterX(vView: vView)); break
        case .rightOf:      constraints.append(alignRightOf(vView: vView,     superView: subX!)); break
        case .rightInside:  constraints.append(alignRightInside(vView: vView, superView: subX!)); break
        case .leftOf:       constraints.append(alignLeftOf(vView: vView,      superView: subX!)); break
        case .leftInside:   constraints.append(alignLeftInside(vView: vView,  superView: subX!)); break
        case .leftEven:     constraints.append(alignLeftEven(vView: vView,    superView: subX!)); break
        }
        
        switch vert
        {
        case .top:          constraints.append(alignTop(vView: vView)); break
        case .topMargin:    constraints.append(alignTopMargin(vView: vView)); break
        case .bottom:       constraints.append(alignBottom(vView: vView)); break
        case .center:       constraints.append(alignCenterY(vView: vView)); break
        case .above:        constraints.append(alignAbove(vView: vView,       superView: subY!)); break
        case .aboveInside:  constraints.append(alignAboveInside(vView: vView, superView: subY!)); break
        case .belowInside:  constraints.append(alignBelowInside(vView: vView, superView: subY!)); break
        case .below:        constraints.append(alignBelow(vView: vView,       superView: subY!)); break
        }
        
        if(widthPct != 0)
        {
            constraints.append(alignSetWidth(vView: vView, vConstantWidth: widthPct * data.portraitScreenWidth))
        }
        
        if(heightPct != 0)
        {
            constraints.append(alignSetHeight(vView: vView, vConstantHeight: heightPct * data.portraitScreenHeight))
        }
        
        for vConstraint in constraints
        {
            data.portraitConstraints.append(vConstraint)
        }
    }
    //**********************************************************
    func alignSetWidth(vView: UIView, vConstantWidth: CGFloat)-> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: vConstantWidth)
    }
    //**********************************************************
    func alignSetHeight(vView: UIView, vConstantHeight: CGFloat)-> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: vConstantHeight)
    }
    //**********************************************************
    func alignCenterX(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignCenterY(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignRightOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignLeftOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: -screenConstant)
    }
    //**********************************************************
    func alignAbove(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: -screenConstant)
    }
    //**********************************************************
    func alignBelow(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignLeft(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .leftMargin, relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignRight(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignTop(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignBottom(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignTopMargin(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: UIScreen.main.bounds.height * 0.08 )
    }
    //**********************************************************
    func alignAboveInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: screenConstant)
    }
    //**********************************************************
    func alignBelowInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: -screenConstant)
    }
    //**********************************************************
    func alignLeftInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1, constant: screenConstant * 2) //10)
    }
    //**********************************************************
    func alignLeftEven(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignRightInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .right, relatedBy: .equal, toItem: superView, attribute: .right, multiplier: 1, constant: -(screenConstant * 2)) //10)10)
    }
    //**************************************************************************
    func enable(vView: UIButton)
    {
        vView.isEnabled = true
        vView.setTitleColor(AppColor.defaultEnabled , for: .normal)
        vView.layer.borderColor = AppColor.defaultGame.cgColor
    }
    //**************************************************************************
    func disable(vView: UIButton)
    {
        vView.isEnabled = false
        vView.setTitleColor(AppColor.defaultDisabled , for: .normal)
        vView.layer.borderColor = AppColor.defaultDisabled.cgColor
    }
    //**************************************************************************
    func enable(vView: UILabel)
    {
        vView.textColor = AppColor.defaultEnabled
    }
    //**************************************************************************
    func disable(vView: UILabel)
    {
        vView.textColor = AppColor.defaultDisabled
    }
    //**************************************************************************
    func show(vGroup: Int)
    {
        for subview in view.subviews
        {
            if(subview.tag == vGroup)
            {
                //print("show buttons: \(subview.tag)")
                subview.isHidden = false
            }
        }
    }
    //**************************************************************************
    func hide(vGroup: Int)
    {
        for subview in view.subviews
        {
            if(subview.tag == vGroup)
            {
                //print("\(vGroup) show buttons: \(subview.tag) \(subview.description)")
                subview.isHidden = true
            }
        }
    }
    //**********************************************************
}


