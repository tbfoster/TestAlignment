import UIKit

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
enum alignWidth
{
    case
    width, none
}
//**********************************************************
enum alignHeight
{
    case
    height, none
}
//**********************************************************
struct AppColor {
    static let primary  = UIColor(red: 0.4392156863, green: 0.7490196078, blue: 0.6509803922, alpha: 1)
    static let disabled = UIColor(red: 209/255, green: 33/255, blue: 70/255, alpha: 1)
}
//**********************************************************

class GameViewController: UIViewController {
    
    let HUDLabel = UILabel()
    let HUDLabel2 = UILabel()
    
    //**************************************************************************
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let vX = UIScreen.main.bounds.width * 0.70
        let vY = UIScreen.main.bounds.height * 0.60
        let vX2 = UIScreen.main.bounds.height * 0.20
        
        addButton(vView: view, vTitle: "Center", vTag: 102, vAlignText: .bottom, vAlignX: .center, vAlignY: .center, vAlignWidth: .width, vAlignHeight: .height, vWidth: vX, vHeight: vY, vSubX: nil, vSubY: nil)
        
        addButton(vView: view, vTitle: "LeftTop", vTag: 103, vAlignText: .center, vAlignX: .left, vAlignY: .top, vAlignWidth: .none, vAlignHeight: .none, vWidth: 160, vHeight: 200, vSubX: nil, vSubY: nil)
        addButton(vView: view, vTitle: "RightTop", vTag: 104, vAlignText: .center, vAlignX: .right, vAlignY: .top, vAlignWidth: .none, vAlignHeight: .none, vWidth: 160, vHeight: 200, vSubX: nil, vSubY: nil)

        addButton(vView: view, vTitle: "LeftBottom", vTag: 105, vAlignText: .center, vAlignX: .left, vAlignY: .bottom, vAlignWidth: .none, vAlignHeight: .none, vWidth: 160, vHeight: 200, vSubX: nil, vSubY: nil)
        addButton(vView: view, vTitle: "RightBottom", vTag: 106, vAlignText: .center, vAlignX: .right, vAlignY: .bottom, vAlignWidth: .none, vAlignHeight: .none, vWidth: 160, vHeight: 200, vSubX: nil, vSubY: nil)

        addButton(vView: view, vTitle: "RO >>", vTag: 106, vAlignText: .center, vAlignX: .rightOf, vAlignY: .center, vAlignWidth: .none, vAlignHeight: .height, vWidth: 160, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        addButton(vView: view, vTitle: "LO <<", vTag: 107, vAlignText: .center, vAlignX: .leftOf, vAlignY: .center, vAlignWidth: .none, vAlignHeight: .height, vWidth: 160, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        
        addButton(vView: view, vTitle: "Below", vTag: 108, vAlignText: .center, vAlignX: .center, vAlignY: .below, vAlignWidth: .none, vAlignHeight: .none, vWidth: 0, vHeight: 0, vSubX: 102, vSubY: 102)
        addButton(vView: view, vTitle: "Above", vTag: 109, vAlignText: .center, vAlignX: .center, vAlignY: .above, vAlignWidth: .width, vAlignHeight: .none, vWidth: vX2, vHeight: 0, vSubX: 102, vSubY: 102)
        
        addButton(vView: view, vTitle: "AboveLeft", vTag: 110, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vAlignWidth: .width, vAlignHeight: .none, vWidth: vX2, vHeight: 0, vSubX: 109, vSubY: 102)
        addButton(vView: view, vTitle: "AboveRight", vTag: 111, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vAlignWidth: .width, vAlignHeight: .none, vWidth: vX2, vHeight: 0, vSubX: 109, vSubY: 102)
        
        
        addHUDLabel()
    }
    //**********************************************************
    func addButton(vView: UIView, vTitle: String, vTag: Int, vAlignText: alignText, vAlignX: alignX, vAlignY: alignY, vAlignWidth: alignWidth, vAlignHeight: alignHeight, vWidth: CGFloat, vHeight: CGFloat, vSubX: Int?, vSubY: Int?)
    {
        var constraints: [NSLayoutConstraint] = []
        let vButton = UIButton()
        vButton.tag = vTag
        vButton.setTitle(vTitle, for: .normal)
        vButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 48)
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
        print("UIBounds: \(UIScreen.main.bounds)")
        
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
        
        switch(vAlignWidth)
        {
        case .width:
            constraints.append(alignSetWidth(vView: vButton, vConstantWidth: vWidth)); break
        case .none: break
        }
        
        switch(vAlignHeight)
        {
        case .height:
            constraints.append(alignSetHeight(vView: vButton, vConstantHeight: vHeight)); break
        case .none: break
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    //**********************************************************
    func alignSetWidth(vView: UIView, vConstantWidth: CGFloat)-> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier:1, constant: vConstantWidth)
    }
    //**********************************************************
    func alignSetHeight(vView: UIView, vConstantHeight: CGFloat)-> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier:1, constant: vConstantHeight)
    }
    //**********************************************************
    func alignCenterX(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignCenterY(vView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignRightOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignLeftOf(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1, constant: 0)
    }
    
    //**********************************************************
    func alignAbove(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1, constant: 0)
    }
    //**********************************************************
    func alignBelow(vView: UIView, superView: UIView) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: vView, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1, constant: 0)
    }
    
    //**********************************************************
    func alignLeft(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .leftMargin, relatedBy: .equal, toItem: view, attribute: .leftMargin, multiplier: 1, constant: 0)
        return vConstraint
    }
    //**********************************************************
    func alignRight(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1, constant: 0)
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
    
    func addHUDLabel()
    {
        HUDLabel.text = "THIS IS A TEST"
        HUDLabel.textAlignment = .center
        HUDLabel.textColor = AppColor.primary
        HUDLabel.font = UIFont.boldSystemFont(ofSize: 48)
        HUDLabel.adjustsFontSizeToFitWidth = true
        HUDLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(HUDLabel)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: HUDLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: HUDLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: HUDLabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: HUDLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 48)
            ])
    }
    //**********************************************************

    func addHUDLabel2()
    {
        HUDLabel.textAlignment = .center
        HUDLabel2.textColor = AppColor.primary
        HUDLabel2.font = UIFont.boldSystemFont(ofSize: 48)
        HUDLabel2.adjustsFontSizeToFitWidth = true
        HUDLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(HUDLabel2)
        HUDLabel2.addConstraint(NSLayoutConstraint(
            
            item:HUDLabel2, attribute:NSLayoutAttribute.top,
            
            relatedBy:NSLayoutRelation.equal, toItem:view,
            
            attribute:NSLayoutAttribute.bottom, multiplier:1.0, constant: 0.0))
        
       
        
    }
    //**********************************************************

}
