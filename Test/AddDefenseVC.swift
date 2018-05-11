import UIKit

// Menu Main
let BTN_AD_RETURN     = 13000
//let BTN_MAIN_UPGRADE_DEFENSE = 12001

//**************************************************************************
class AddDefenseVC: UIViewController
{
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
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
        
        designer.addLabel(vView: view, vTitle: "This is the HUD", vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0)
        
        designer.addButton(vView: view, vTitle: "💥 Select", vTag: 102, vAlignText: .center, vAlignX: .center, vAlignY: .center, vWidth: vX, vHeight: vY, vSubX: nil, vSubY: nil)
        
        designer.addButton(vView: view, vTitle: "Ⓜ️enu", vTag: BTN_AD_RETURN, vAlignText: .center, vAlignX: .left, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        let vButton = view.viewWithTag(BTN_AD_RETURN) as! UIButton
        vButton.addTarget(self, action: #selector(handleButton(button:)), for: .touchUpInside)
        
        
        designer.addButton(vView: view, vTitle: "RightTop", vTag: 104, vAlignText: .center, vAlignX: .right, vAlignY: .top, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        
        designer.addButton(vView: view, vTitle: "LeftBottom", vTag: 105, vAlignText: .center, vAlignX: .left, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        designer.addButton(vView: view, vTitle: "RightBottom", vTag: 106, vAlignText: .center, vAlignX: .right, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        
        designer.addButton(vView: view, vTitle: "Next", vTag: 106, vAlignText: .center, vAlignX: .rightOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        designer.addButton(vView: view, vTitle: "Prev", vTag: 107, vAlignText: .center, vAlignX: .leftOf, vAlignY: .center, vWidth: vX2, vHeight: vY / 2, vSubX: 102, vSubY: nil)
        
        designer.addButton(vView: view, vTitle: "❌ Remove", vTag: 109, vAlignText: .center, vAlignX: .center, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 102, vSubY: 102)
        designer.addButton(vView: view, vTitle: "☢️ Repair", vTag: 110, vAlignText: .center, vAlignX: .leftOf, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 109, vSubY: 102)
        designer.addButton(vView: view, vTitle: "👾 Add Riser", vTag: 111, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vTopButtonX, vHeight: 0, vSubX: 109, vSubY: 102)
        
        designer.addLabel(vView: view, vTitle: "Chlorine Laser 20Kw", vTag: 1000, vAlignX: .center, vAlignY: .aboveInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 102)
        designer.addLabel(vView: view, vTitle: "💰 300", vTag: 230, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: nil, vSubY: 1000)
        designer.addLabel(vView: view, vTitle: "Remaining Inventory: 19", vTag: 1001, vAlignX: .center, vAlignY: .belowInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 102)
        
        designer.addLabel(vView: view, vTitle: "Reload", vTag: 113, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: nil, vSubY: 102)
        designer.addProgressBar(vView: view, vProgress: 0.4, vTag: 114, vAlignX: .center, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: nil, vSubY: 113)
        
        designer.addLabel(vView: view, vTitle: "Shields", vTag: 115, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102)
        designer.addProgressBar(vView: view, vProgress: 0.6, vTag: 116, vAlignX: .leftOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
        
        designer.addLabel(vView: view, vTitle: "Power", vTag: 117, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vY2, vSubX: 113, vSubY: 102)
        designer.addProgressBar(vView: view, vProgress: 0.8, vTag: 118, vAlignX: .rightOf, vAlignY: .below, vWidth: vProgressX, vHeight: vProgressY, vSubX: 114, vSubY: 115)
        
        designer.addPageControl(vView: view, vTag: 120, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 0)
        
        let vBlink = view.viewWithTag(1001) as! UILabel
        vBlink.startBlink()
        
    }
    //**************************************************************************
    @objc func handleButton(button: UIButton) {
        switch button.tag
        {
        case BTN_AD_RETURN:
            AddDefenseVC().dismiss(animated: true, completion: nil)
            present(MainMenuViewController(), animated: true, completion: nil)
            break
        default:
            break
        }
    }
    //**************************************************************************
}
