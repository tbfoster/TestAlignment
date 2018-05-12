import UIKit

//**********************************************************
enum alignText
{
    case bottom, top, center
}
//**********************************************************
enum alignX
{
    case
    left, right, center, rightOf, leftOf, leftInside, leftEven
}
//**********************************************************
enum alignY
{
    case
    top, bottom, center, below, above, aboveInside, belowInside
}
//**********************************************************
struct AppColor {
    static let primary  = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let enabled  = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let disabled = UIColor.red
    
    static let background = UIColor.green
    static let labelFrame = UIColor.lightGray
}
//**********************************************************
class UIDesigner
{
    var view: UIView
    var font = UIFont()
    var defaultButtonHeight: CGFloat = 0
    
    //**********************************************************
    init(vView: UIView)
    {
        view = vView
        switch UIDevice.current.userInterfaceIdiom
        {
        case .phone:
            font = UIFont.boldSystemFont(ofSize: 16)
            break
        case .pad:
            font = UIFont.boldSystemFont(ofSize: 32)
            break
        case .unspecified:
            font = UIFont.boldSystemFont(ofSize: 16)
            break
        default:
            break
        }
    }
    //**********************************************************
    func addPageControl(vStartPage: Int, vMaxPages: Int) -> UIPageControl
    {
        let vPageControl = UIPageControl()
        vPageControl.currentPage = vStartPage
        vPageControl.numberOfPages = vMaxPages
        vPageControl.pageIndicatorTintColor = AppColor.primary
        vPageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vPageControl)
        return vPageControl
    }
    //**********************************************************
    func addLabel(vTitle: String, vAlignText: alignText, vInvertColors: Bool, vhasFrame: Bool) -> UILabel
    {
        let vLabel = UILabel()
        vLabel.text = vTitle
        vLabel.textAlignment = .center
        if(vInvertColors == true)
        {
            vLabel.textColor = UIColor.black
            vLabel.backgroundColor = AppColor.primary
        }
        else
        {
            vLabel.textColor = AppColor.primary
            vLabel.backgroundColor = UIColor.black
        }
        if(vhasFrame == true)
        {
            vLabel.layer.borderColor = AppColor.labelFrame.cgColor
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
    func addProgressBar(vProgress: Float) -> UIProgressView
    {
        let vProgressBar = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        vProgressBar.progressViewStyle = .default
        vProgressBar.trackTintColor = AppColor.primary
        vProgressBar.progressTintColor = UIColor.red
        vProgressBar.translatesAutoresizingMaskIntoConstraints = false
        vProgressBar.setProgress(vProgress, animated: false)
        view.addSubview(vProgressBar)
        return vProgressBar
    }
    //**********************************************************
    func addButton(vTitle: String, vAlignText: alignText) -> UIButton
    {
        let vButton = UIButton()
        vButton.setTitle(vTitle, for: .normal)
        vButton.titleLabel?.font = font
        vButton.layer.borderColor = AppColor.primary.cgColor
        vButton.layer.borderWidth = 3
        vButton.layer.cornerRadius = 10
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
    func addAlignment(vView: UIView, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: UIView?, vSubY: UIView?)
    {
        var constraints: [NSLayoutConstraint] = []
        
        switch vAlignX
        {
        case .left:         constraints.append(alignLeft(vView: vView)); break
        case .right:        constraints.append(alignRight(vView: vView)); break
        case .center:       constraints.append(alignCenterX(vView: vView)); break
        case .rightOf:      constraints.append(alignRightOf(vView: vView,     superView: vSubX!)); break
        case .leftOf:       constraints.append(alignLeftOf(vView: vView,      superView: vSubX!)); break
        case .leftInside:   constraints.append(alignLeftInside(vView: vView,  superView: vSubX!)); break
        case .leftEven:     constraints.append(alignLeftEven(vView: vView,    superView: vSubX!)); break
        }
        
        switch vAlignY
        {
        case .top:          constraints.append(alignTop(vView: vView)); break
        case .bottom:       constraints.append(alignBottom(vView: vView)); break
        case .center:       constraints.append(alignCenterY(vView: vView)); break
        case .above:        constraints.append(alignAbove(vView: vView,       superView: vSubY!)); break
        case .aboveInside:  constraints.append(alignAboveInside(vView: vView, superView: vSubY!)); break
        case .belowInside:  constraints.append(alignBelowInside(vView: vView, superView: vSubY!)); break
        case .below:        constraints.append(alignBelow(vView: vView,       superView: vSubY!)); break
        }
        
        if(vWidth != 0)
        {
            constraints.append(alignSetWidth(vView: vView, vConstantWidth: vWidth))
        }
        
        if(vHeight != 0)
        {
            constraints.append(alignSetHeight(vView: vView, vConstantHeight: vHeight))
        }
        
        NSLayoutConstraint.activate(constraints)
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
        return NSLayoutConstraint(item: vView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 5)
    }
    //**********************************************************
    func alignCenterY(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 5)
    }
    //**********************************************************
    func alignRightOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 5)
    }
    //**********************************************************
    func alignLeftOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: -5)
    }
    //**********************************************************
    func alignAbove(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: -5)
    }
    //**********************************************************
    func alignBelow(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: 5)
    }
    func alignLeft(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .leftMargin, relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1, constant: 5)
        return vConstraint
    }
    //**********************************************************
    func alignRight(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1, constant: 5)
        return vConstraint
    }
    //**********************************************************
    func alignTop(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10)
        return vConstraint
    }
    //**********************************************************
    func alignBottom(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        return vConstraint
    }
    //**********************************************************
    func alignAboveInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 5)
    }
    //**********************************************************
    func alignBelowInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: -5)
    }
    //**********************************************************
    func alignLeftInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1, constant: 10)
        return vConstraint
    }
    //**********************************************************
    func alignLeftEven(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1, constant: 0)
        return vConstraint
    }
}
//**********************************************************
extension UILabel {
    //**********************************************************
    func startBlink() {
        UIView.animate(withDuration: 0.8,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0 },
                       completion: nil)
    }
    //**********************************************************
    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
    //**********************************************************
}
