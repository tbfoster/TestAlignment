import UIKit

// Menu Main
let BTN_UD_RETURN        = 14000
let BTN_UD_REMOVE        = 14001
let BTN_UD_UPGRADE       = 14002
let BTN_UD_REPAIR        = 14003
let BTN_UD_SHIELDS       = 14004
let BTN_UD_RELOAD        = 14005
let BTN_UD_POWER         = 14006
let BTN_UD_SHIELDSL      = 14007
let BTN_UD_RELOADL       = 14008
let BTN_UD_POWERL        = 14009
let BTN_UD_LBL_WEAPON    = 14010

//**************************************************************************
class UpgradeDefenseVC: UIViewController
{
    var vUILoaded: Bool = false
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print("DID LOADF")
        
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        if(vUILoaded == false)
        {
            loadUI(vView: view)
        }
        
        vUILoaded = true
    }
    //**************************************************************************
    func loadUI(vView: UIView)
    {
        let designer = UIDesigner.init(vView: view)
        
        let vSelectX = UIScreen.main.bounds.width * 0.70
        let vSelectY = UIScreen.main.bounds.height * 0.60
        
        let vProgY = UIScreen.main.bounds.height * 0.05
        let vProgX = UIScreen.main.bounds.height * 0.25
        let vProgYInd = UIScreen.main.bounds.height * 0.02
        
        let vActionX = UIScreen.main.bounds.width * 0.25
        let vActionY = UIScreen.main.bounds.width * 0.08
        
//        designer.addLabel(vTitle: "HUD",        vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0, vInvertColors: false, vhasFrame: false)
//
//        designer.addButton(vTitle: "💥 Select", vTag: BTN_UD_UPGRADE, vAlignText: .center, vAlignX: .center, vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY, vSubX: nil, vSubY: nil)
//
//        designer.addButton(vTitle: "❌ Remove", vTag: BTN_UD_REMOVE, vAlignText: .center, vAlignX: .center, vAlignY: .above, vWidth: vActionX, vHeight: vActionY, vSubX: BTN_UD_UPGRADE, vSubY: BTN_UD_UPGRADE)
//        designer.addButton(vTitle: "Back",      vTag: BTN_UD_RETURN, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vWidth: vActionX, vHeight: vActionY, vSubX: BTN_UD_REMOVE, vSubY: BTN_UD_UPGRADE)
//        designer.addButton(vTitle: "☢️ Repair", vTag: BTN_UD_REPAIR, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vActionX, vHeight: vActionY, vSubX: BTN_UD_REMOVE, vSubY: BTN_UD_UPGRADE)
//
//        designer.addLabel(vTitle: "Wep 💰 300", vTag: BTN_UD_LBL_WEAPON, vAlignX: .center, vAlignY: .aboveInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: BTN_UD_UPGRADE, vInvertColors: true, vhasFrame: false)
//
//        designer.addLabel(vTitle: "Reload",     vTag: BTN_UD_RELOAD, vAlignX: .center, vAlignY: .below, vWidth: vProgX, vHeight: vProgY, vSubX: nil, vSubY: BTN_UD_UPGRADE, vInvertColors: true, vhasFrame: true)
//        designer.addProgressBar(vProgress: 0.4, vTag: BTN_UD_RELOADL, vAlignX: .center, vAlignY: .below, vWidth: vProgX, vHeight: vProgYInd, vSubX: nil, vSubY: BTN_UD_RELOAD)
//
//        designer.addLabel(vTitle: "Shields",    vTag: BTN_UD_SHIELDS, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgX, vHeight: vProgY, vSubX: BTN_UD_RELOAD, vSubY: BTN_UD_UPGRADE, vInvertColors: true, vhasFrame: true)
//        designer.addProgressBar(vProgress: 0.6, vTag: BTN_UD_SHIELDSL, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgX, vHeight: vProgYInd, vSubX: BTN_UD_RELOAD, vSubY: BTN_UD_SHIELDS)
//
//        designer.addLabel(vTitle: "Power",      vTag: BTN_UD_POWER, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgX, vHeight: vProgY, vSubX: BTN_UD_RELOAD, vSubY: BTN_UD_UPGRADE, vInvertColors: true, vhasFrame: true)
//        designer.addProgressBar(vProgress: 0.8, vTag: BTN_UD_POWERL, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgX, vHeight: vProgYInd, vSubX: BTN_UD_RELOAD, vSubY: BTN_UD_POWER)
//
//        // Actions
//        let vButton1 = view.viewWithTag(BTN_UD_RETURN) as! UIButton
//        vButton1.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
//
        
        
        
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
            UpgradeDefenseVC().dismiss(animated: true, completion: nil)
            present(MainMenuViewController(), animated: true, completion: nil)
    }
    
    //**************************************************************************
}
