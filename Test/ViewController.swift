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

class GameViewController: UIViewController {
    
    let HUDLabel = UILabel()
    
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
        
        let designer = UIDesigner.init(vView: view)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let vX = UIScreen.main.bounds.width * 0.70
        let vY = UIScreen.main.bounds.height * 0.60
        let vX2 = UIScreen.main.bounds.width * 0.12
        let vY2 = UIScreen.main.bounds.height * 0.05
        let vTopButtonX = UIScreen.main.bounds.width * 0.25
        let vProgressX = UIScreen.main.bounds.height * 0.25
        let vProgressY = UIScreen.main.bounds.height * 0.02
        
//        designer.addLabel(vTitle: "This is the HUD", vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0, vInvertColors: false, vhasFrame: false)
//
//        designer.addButton(vTitle: "💥 Select", vTag: 102, vAlignText: .center, vAlignX: .center, vAlignY: .center, vWidth: vX, vHeight: vY, vSubX: nil, vSubY: nil)
//
//        designer.addButton(vTitle: "Ⓜ️enu", vTag: 103, vAlignText: .center, vAlignX: .left, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
//        designer.addButton(vTitle: "RightTop", vTag: 104, vAlignText: .center, vAlignX: .right, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
//
//        designer.addButton(vTitle: "LeftBottom", vTag: 105, vAlignText: .center, vAlignX: .left, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
//        designer.addButton(vTitle: "RightBottom", vTag: 106, vAlignText: .center, vAlignX: .right, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
//
//        designer.addButton(vTitle: "Next", vTag: 106, vAlignText: .center, vAlignX: .rightOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
//        designer.addButton(vTitle: "Prev", vTag: 107, vAlignText: .center, vAlignX: .leftOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
//
//        designer.addButton(vTitle: "❌ Remove", vTag: 109, vAlignText: .center, vAlignX: .center, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 102, vSubY: 102)
//        designer.addButton(vTitle: "☢️ Repair", vTag: 110, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 109, vSubY: 102)
//        designer.addButton(vTitle: "👾 Add Riser", vTag: 111, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 109, vSubY: 102)
//
//        designer.addLabel(vTitle: "Chlorine Laser 20Kw", vTag: 1000, vAlignX: .center, vAlignY: .aboveInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 102, vInvertColors: true, vhasFrame: <#Bool#>)
//        designer.addLabel(vTitle: "💰 300", vTag: 230, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: nil, vSubY: 1000, vInvertColors: true, vhasFrame: <#Bool#>)
//        designer.addLabel(vTitle: "Remaining Inventory: 19", vTag: 1001, vAlignX: .center, vAlignY: .belowInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 102, vInvertColors: true, vhasFrame: <#Bool#>)
//
//        designer.addLabel(vTitle: "Reload", vTag: 113, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: nil, vSubY: 102, vInvertColors: true, vhasFrame: <#Bool#>)
//        designer.addProgressBar(vProgress: 0.4, vTag: 114, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: nil, vSubY: 113)
//
//        designer.addLabel(vTitle: "Shields", vTag: 115, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102, vInvertColors: true, vhasFrame: <#Bool#>)
//        designer.addProgressBar(vProgress: 0.6, vTag: 116, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
//
//        designer.addLabel(vTitle: "Power", vTag: 117, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102, vInvertColors: true, vhasFrame: <#Bool#>)
//        designer.addProgressBar(vProgress: 0.8, vTag: 118, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
//
//        designer.addPageControl(vTag: 120, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 0)
//
//        let vBlink = view.viewWithTag(1001) as! UILabel
//        vBlink.startBlink()
        
        print("UIBounds: \(UIScreen.main.bounds)")
    }
    //**********************************************************
    
}

