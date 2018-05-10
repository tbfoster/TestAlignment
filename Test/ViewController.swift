import UIKit

//**********************************************************
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
//**********************************************************
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}
//**********************************************************
enum alignText
{
    case bottom, top, center
}
//**********************************************************
enum alignX
{
    case
    left, right, center, rightOf, leftOf
}
//**********************************************************
enum alignY
{
    case
    top, bottom, center, below, above
}
//**********************************************************
struct AppColor {
    static let primary  = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let disabled = UIColor(red: 209/255, green: 33/255, blue: 70/255, alpha: 1)
    static let background = UIColor(red: 209/255, green: 33/255, blue: 70/255, alpha: 1) // TODO
}
//**********************************************************

class GameViewController: UIViewController {
    
    let HUDLabel = UILabel()
    //let HUDLabel2 = UILabel()
    var font = UIFont()
    
    //**************************************************************************
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    //**************************************************************************
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        // Portrait versus landscape - remove/reload constraints?
    }
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
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
        
        let vX = UIScreen.main.bounds.width * 0.70
        let vY = UIScreen.main.bounds.height * 0.60
        let vX2 = UIScreen.main.bounds.width * 0.10
        let vY2 = UIScreen.main.bounds.height * 0.05
        
        let vProgressX = UIScreen.main.bounds.height * 0.25
        let vProgressY = UIScreen.main.bounds.height * 0.02
        
        addLabel(vView: view, vTitle: "This is the HUD", vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0)
        
        addButton(vView: view, vTitle: "Select", vTag: 102, vAlignText: .bottom, vAlignX: .center, vAlignY: .center, vWidth: vX, vHeight: vY, vSubX: nil, vSubY: nil)
        
        addButton(vView: view, vTitle: "Back", vTag: 103, vAlignText: .center, vAlignX: .left, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        addButton(vView: view, vTitle: "RightTop", vTag: 104, vAlignText: .center, vAlignX: .right, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)

        addButton(vView: view, vTitle: "LeftBottom", vTag: 105, vAlignText: .center, vAlignX: .left, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        addButton(vView: view, vTitle: "RightBottom", vTag: 106, vAlignText: .center, vAlignX: .right, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)

        addButton(vView: view, vTitle: ">>", vTag: 106, vAlignText: .center, vAlignX: .rightOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        addButton(vView: view, vTitle: "<<", vTag: 107, vAlignText: .center, vAlignX: .leftOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        
        addButton(vView: view, vTitle: "3", vTag: 109, vAlignText: .center, vAlignX: .center, vAlignY: .above, vWidth: vX2, vHeight: 0, vSubX: 102, vSubY: 102)
        addButton(vView: view, vTitle: "2", vTag: 110, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vWidth: vX2, vHeight: 0, vSubX: 109, vSubY: 102)
        addButton(vView: view, vTitle: "4", vTag: 111, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vX2, vHeight: 0, vSubX: 109, vSubY: 102)
        addButton(vView: view, vTitle: "1", vTag: 111, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vWidth: vX2, vHeight: 0, vSubX: 110, vSubY: 102)
        addButton(vView: view, vTitle: "5", vTag: 112, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above,  vWidth: vX2, vHeight: 0, vSubX: 111, vSubY: 102)
        
        addLabel(vView: view, vTitle: "Reload", vTag: 113, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: nil, vSubY: 102)
        addProgressBar(vView: view, vProgress: 0.4, vTag: 114, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: nil, vSubY: 113)
        
        addLabel(vView: view, vTitle: "Shields", vTag: 115, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102)
        addProgressBar(vView: view, vProgress: 0.6, vTag: 116, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
        
        addLabel(vView: view, vTitle: "Shields", vTag: 117, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102)
        addProgressBar(vView: view, vProgress: 0.8, vTag: 118, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
        
        print("UIBounds: \(UIScreen.main.bounds)")
    }
    //**********************************************************
    func addLabel(vView: UIView, vTitle: String, vTag: Int, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        let vButton = UILabel()
        vButton.text = vTitle
        vButton.textAlignment = .center
        vButton.textColor = AppColor.primary
        vButton.font = font
        vButton.adjustsFontSizeToFitWidth = true
        vButton.tag = vTag
        vButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vButton)
        addAlignment(vView: vView, vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addProgressBar(vView: UIView, vProgress: Float, vTag: Int, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        let vButton = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        vButton.tag = vTag
        vButton.trackTintColor = AppColor.primary
        vButton.progressTintColor = UIColor.red
        vButton.translatesAutoresizingMaskIntoConstraints = false
        vButton.setProgress(vProgress, animated: false)
        view.addSubview(vButton)
        addAlignment(vView: vView, vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addButton(vView: UIView, vTitle: String, vTag: Int, vAlignText: alignText, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
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
        addAlignment(vView: vView, vButton: vButton, vAlignX: vAlignX, vAlignY: vAlignY, vWidth: vWidth, vHeight: vHeight, vSubX: vSubX, vSubY: vSubY)
    }
    //**********************************************************
    func addAlignment(vView: UIView, vButton: UIView, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        var constraints: [NSLayoutConstraint] = []
        
        switch vAlignX
        {
        case .left:    constraints.append(alignLeft(vView: vButton)); break
        case .right:   constraints.append(alignRight(vView: vButton)); break
        case .center:  constraints.append(alignCenterX(vView: vButton)); break
        case .rightOf: constraints.append(alignRightOf(vView: vButton, superView: vView.viewWithTag(vSubX!)!)); break
        case .leftOf:  constraints.append(alignLeftOf(vView: vButton, superView: vView.viewWithTag(vSubX!)!)); break
        }
        
        switch vAlignY
        {
        case .top:    constraints.append(alignTop(vView: vButton)); break
        case .bottom: constraints.append(alignBottom(vView: vButton)); break
        case .center: constraints.append(alignCenterY(vView: vButton)); break
        case .above:  constraints.append(alignAbove(vView: vButton, superView: vView.viewWithTag(vSubY!)!)); break
        case .below:  constraints.append(alignBelow(vView: vButton, superView: vView.viewWithTag(vSubY!)!)); break
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
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -5)
        return vConstraint
    }
    //**********************************************************
}
