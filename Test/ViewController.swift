import UIKit

//**********************************************************
enum alignX
{
    case
    left, right, center
}
//**********************************************************
enum alignY
{
    case
    top, bottom, center
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
        
        addButton(vView: view, vTitle: "Left Btn", vAlignX: .left, vAlignY: .center, vWidth: 100, vHeight: 50)
        addButton(vView: view, vTitle: "Right Btn", vAlignX: .right, vAlignY: .center, vWidth: 100, vHeight: 50)
        addButton(vView: view, vTitle: "Center", vAlignX: .center, vAlignY: .center, vWidth: 160, vHeight: 200)
        
        addButton(vView: view, vTitle: "LeftTop", vAlignX: .left, vAlignY: .top, vWidth: 160, vHeight: 200)
        addButton(vView: view, vTitle: "RightTop", vAlignX: .right, vAlignY: .top, vWidth: 160, vHeight: 200)
        
        addButton(vView: view, vTitle: "LeftBottom-", vAlignX: .left, vAlignY: .bottom, vWidth: 160, vHeight: 200)
        addButton(vView: view, vTitle: "RightBottom", vAlignX: .right, vAlignY: .bottom, vWidth: 160, vHeight: 200)
        
        addHUDLabel()
    }
    //**********************************************************
    func addButton(vView: UIView, vTitle: String, vAlignX: alignX, vAlignY: alignY, vWidth: CGFloat, vHeight: CGFloat)
    {
        var constraints: [NSLayoutConstraint] = []
        let vButton = UIButton()
        vButton.setTitle(vTitle, for: .normal)
        vButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 48)
        vButton.layer.borderColor = AppColor.primary.cgColor
        vButton.layer.borderWidth = 3
        vButton.layer.cornerRadius = 10
        //vButton.frame = CGRect(x: 0, y: 0, width: vWidth, height: vHeight)
        vButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vButton)
        
        switch vAlignX
        {
        case .left:
            constraints.append(alignLeft(vView: vButton))
            break
        case .right:
            constraints.append(alignRight(vView: vButton))
            break
        case .center:
            constraints.append(alignCenterX(vView: vButton))
            break
        }
        switch vAlignY
        {
        case .top:
            constraints.append(alignTop(vView: vButton))
            break
        case .bottom:
            constraints.append(alignBottom(vView: vButton))
            break
        case .center:
            constraints.append(alignCenterY(vView: vButton))
            break
        }
        
        //constraints.append(setWidth(vView: vView, vWidth: vWidth))
        //constraints.append(setHeight(vView: vView, vHeight: vHeight))
        NSLayoutConstraint.activate(constraints)
    }
    //**********************************************************
    func alignCenterX(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        return vConstraint
    }
    //**********************************************************
    func alignCenterY(vView: UIView) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        return vConstraint
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
    func setWidth(vView: UIView, vWidth: CGFloat) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        return vConstraint
    }
    //**********************************************************
    func setHeight(vView: UIView, vHeight: CGFloat) -> NSLayoutConstraint
    {
        let vConstraint = NSLayoutConstraint(item: vView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
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
            NSLayoutConstraint(item: HUDLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .top,
                               multiplier: 1,
                               constant: 10),
            NSLayoutConstraint(item: HUDLabel,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .left,
                               multiplier: 1,
                               constant: 20),
            NSLayoutConstraint(item: HUDLabel,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .right,
                               multiplier: 1,
                               constant: -20),
            NSLayoutConstraint(item: HUDLabel,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 48)
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
