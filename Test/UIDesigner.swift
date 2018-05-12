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
    left, right, center, rightOf, leftOf, leftInside
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
    static let disabled = UIColor(red: 209/255, green: 33/255, blue: 70/255, alpha: 1)
    static let background = UIColor(red: 209/255, green: 33/255, blue: 70/255, alpha: 1) // TODO
    static let labelFrame = UIColor(red: 209, green: 32, blue: 69, alpha: 1)
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
    func addPageControl(vTag: Int, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        let vButton = UIPageControl()
        vButton.currentPage = 0
        vButton.numberOfPages = 5
        vButton.pageIndicatorTintColor = AppColor.primary
        vButton.tag = vTag
        vButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vButton)
        addAlignment(vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addLabel(vTitle: String, vTag: Int, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?, vInvertColors: Bool, vhasFrame: Bool)
    {
        let vButton = UILabel()
        vButton.text = vTitle
        vButton.textAlignment = .center
        if(vInvertColors == true)
        {
            vButton.textColor = UIColor.black
            vButton.backgroundColor = AppColor.primary
        }
        else
        {
            vButton.textColor = AppColor.primary
            vButton.backgroundColor = UIColor.black
        }
        if(vhasFrame == true)
        {
            vButton.layer.borderColor = AppColor.labelFrame.cgColor
            vButton.layer.borderWidth = 3
            vButton.layer.cornerRadius = 10
        }
        vButton.font = font
        vButton.adjustsFontSizeToFitWidth = true
        vButton.tag = vTag
        vButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vButton)
        addAlignment(vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addProgressBar(vProgress: Float, vTag: Int, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        let vButton = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        vButton.tag = vTag
        vButton.progressViewStyle = .default
        vButton.trackTintColor = AppColor.primary
        vButton.progressTintColor = UIColor.red
        vButton.translatesAutoresizingMaskIntoConstraints = false
        vButton.setProgress(vProgress, animated: false)
        view.addSubview(vButton)
        addAlignment(vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addButton2(vTitle: String, vTag: Int, vAlignText: alignText) -> UIButton
    {
        let vButton = UIButton()
        vButton.tag = vTag
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
    func addButton(vTitle: String, vTag: Int, vAlignText: alignText, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        let vButton = UIButton()
        vButton.tag = vTag
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
        addAlignment(vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addAlignment(vButton: UIView, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        var constraints: [NSLayoutConstraint] = []
        
        switch vAlignX
        {
        case .left:         constraints.append(alignLeft(vView: vButton)); break
        case .right:        constraints.append(alignRight(vView: vButton)); break
        case .center:       constraints.append(alignCenterX(vView: vButton)); break
        case .rightOf:      constraints.append(alignRightOf(vView: vButton, superView: view.viewWithTag(vSubX!)!)); break
        case .leftOf:       constraints.append(alignLeftOf(vView: vButton, superView: view.viewWithTag(vSubX!)!)); break
        case .leftInside:   constraints.append(alignLeftInside(vView: vButton, superView: view.viewWithTag(vSubX!)!)); break
        }
        
        switch vAlignY
        {
        case .top:          constraints.append(alignTop(vView: vButton)); break
        case .bottom:       constraints.append(alignBottom(vView: vButton)); break
        case .center:       constraints.append(alignCenterY(vView: vButton)); break
        case .above:        constraints.append(alignAbove(vView: vButton, superView: view.viewWithTag(vSubY!)!)); break
        case .aboveInside:  constraints.append(alignAboveInside(vView: vButton, superView: view.viewWithTag(vSubY!)!)); break
        case .belowInside:  constraints.append(alignBelowInside(vView: vButton, superView: view.viewWithTag(vSubY!)!)); break
        case .below:        constraints.append(alignBelow(vView: vButton, superView: view.viewWithTag(vSubY!)!)); break
        }
        
        if(vWidth != 0)
        {
            constraints.append(alignSetWidth(vView: vButton, vConstantWidth: vWidth))
        }
        
        if(vHeight != 0)
        {
            constraints.append(alignSetHeight(vView: vButton, vConstantHeight: vHeight))
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
    //**********************************************************
    func alignLeftInside(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .left, relatedBy: .equal, toItem: superView, attribute: .left, multiplier: 1, constant: 10)
        return vConstraint
    }
}
extension UILabel {
    
    func startBlink() {
        UIView.animate(withDuration: 0.8,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0 },
                       completion: nil)
    }
    
    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}
