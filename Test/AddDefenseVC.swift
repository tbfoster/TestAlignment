import UIKit

// Menu Main
let BTN_AD_RETURN        = 13000
let BTN_AD_ADD_RISER     = 13001
let BTN_AD_ADD           = 13002
let BTN_AD_NEXT          = 13003
let BTN_AD_PREV          = 13004
let BTN_AD_INVENTORY     = 13005
let BTN_AD_SHIELDS       = 13006
let BTN_AD_RELOAD        = 13007
let BTN_AD_POWER         = 13008
let BTN_AD_SHIELDSL      = 13009
let BTN_AD_RELOADL       = 13010
let BTN_AD_POWERL        = 13011
let BTN_AD_LBL_WEAPON    = 13012
let BTN_AD_PAGE_VIEW     = 13013

var btnReturn = UIButton()

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

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
        
        let vSelectX = UIScreen.main.bounds.width * 0.70
        let vSelectY = UIScreen.main.bounds.height * 0.60
        
        let vWeapX = UIScreen.main.bounds.width * 0.69
        
        let vNextX = UIScreen.main.bounds.width * 0.12
        let vNextY = vSelectY / 2
        
        let vProgX = UIScreen.main.bounds.height * 0.25
        let vProgXL = UIScreen.main.bounds.height * 0.28
        let vProgY = UIScreen.main.bounds.height * 0.05
        let vProgYInd = UIScreen.main.bounds.height * 0.02
        
        let vBackX   = UIScreen.main.bounds.width * 0.15
        let vRiserX   = UIScreen.main.bounds.width * 0.54
        let vActionY = UIScreen.main.bounds.width * 0.08
        let vShieldsX = UIScreen.main.bounds.width * 0.23
        
        
        designer.addLabel(vTitle: "HUD", vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0, vInvertColors: false, vhasFrame: false)
        
        designer.addButton(vTitle: "💥 Select", vTag: BTN_AD_ADD, vAlignText: .center, vAlignX: .center, vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY, vSubX: nil, vSubY: nil)
        
        designer.addButton(vTitle: "Next", vTag: BTN_AD_NEXT, vAlignText: .center, vAlignX: .rightOf, vAlignY: .center, vWidth: vNextX, vHeight: vNextY, vSubX: BTN_AD_ADD, vSubY: nil)
        designer.addButton(vTitle: "Prev", vTag: BTN_AD_PREV, vAlignText: .center, vAlignX: .leftOf, vAlignY: .center, vWidth: vNextX, vHeight: vNextY, vSubX: BTN_AD_ADD, vSubY: nil)
        
        //designer.addButton(vTitle: "Back", vTag: BTN_AD_RETURN, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vBackX, vHeight: vActionY, vSubX: BTN_AD_PREV, vSubY: BTN_AD_ADD)
        btnReturn = designer.addButton2(vTitle: "Back", vTag: BTN_AD_RETURN, vAlignText: .center)
        designer.addAlignment(vButton: btnReturn, vAlignX: .rightOf, vAlignY: .above, vWidth: vBackX, vHeight: vActionY, vSubX: BTN_AD_PREV, vSubY: BTN_AD_ADD)
        btnReturn.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
        
        designer.addButton(vTitle: "👾 Add Riser", vTag: BTN_AD_ADD_RISER, vAlignText: .center, vAlignX: .rightOf, vAlignY: .above, vWidth: vRiserX, vHeight: vActionY, vSubX: BTN_AD_RETURN, vSubY: BTN_AD_ADD)
        
        
        
        designer.addLabel(vTitle: "Weapon 💰 300", vTag: BTN_AD_LBL_WEAPON, vAlignX: .center, vAlignY: .aboveInside, vWidth: vWeapX, vHeight: 0, vSubX: 0, vSubY: BTN_AD_ADD, vInvertColors: true, vhasFrame: false)
        designer.addLabel(vTitle: "Inventory: 19", vTag: BTN_AD_INVENTORY, vAlignX: .center, vAlignY: .belowInside, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: BTN_AD_ADD, vInvertColors: true, vhasFrame: false)
        
        designer.addLabel(vTitle: "Reload",        vTag: BTN_AD_RELOAD,   vAlignX: .center, vAlignY: .below, vWidth: vShieldsX, vHeight: vActionY, vSubX: nil, vSubY: BTN_AD_ADD, vInvertColors: false, vhasFrame: true)
        designer.addProgressBar(vProgress: 0.4,    vTag: BTN_AD_RELOADL,  vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: BTN_AD_RELOAD, vSubY: BTN_AD_RELOAD)
        
        designer.addLabel(vTitle: "Shields",       vTag: BTN_AD_SHIELDS, vAlignX: .leftOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vActionY, vSubX: BTN_AD_RELOAD, vSubY: BTN_AD_ADD, vInvertColors: false, vhasFrame: true)
        designer.addProgressBar(vProgress: 0.6,    vTag: BTN_AD_SHIELDSL, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: BTN_AD_SHIELDS, vSubY: BTN_AD_SHIELDS)
        
        designer.addLabel(vTitle: "Power",         vTag: BTN_AD_POWER, vAlignX: .rightOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vActionY, vSubX: BTN_AD_RELOAD, vSubY: BTN_AD_ADD, vInvertColors: false, vhasFrame: true)
        designer.addProgressBar(vProgress: 0.8,    vTag: BTN_AD_POWERL, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: BTN_AD_POWER, vSubY: BTN_AD_POWER)
        
        designer.addPageControl(vTag: BTN_AD_PAGE_VIEW, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: 0, vSubY: 0)

        let vButton = view.viewWithTag(BTN_AD_RETURN) as! UIButton
        vButton.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
        
        let vButton2 = view.viewWithTag(BTN_AD_NEXT) as! UIButton
        vButton2.addTarget(self, action: #selector(handleNextButton(button:)), for: .touchUpInside)
        
        let vButton3 = view.viewWithTag(BTN_AD_PREV) as! UIButton
        vButton3.addTarget(self, action: #selector(handlePrevButton(button:)), for: .touchUpInside)
        
        // Stopped working when I moved designer to its own class
//        let vBlink = view.viewWithTag(BTN_AD_INVENTORY) as! UILabel
//        vBlink.startBlink()
        
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
        AddDefenseVC().dismiss(animated: true, completion: nil)
        present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleNextButton(button: UIButton) {
        let vProg = view.viewWithTag(BTN_AD_PAGE_VIEW) as! UIPageControl
        vProg.currentPage += 1
        
        let vDescription = view.viewWithTag(BTN_AD_LBL_WEAPON) as! UILabel
        vDescription.text = defenseNamesAdd[vProg.currentPage]
    }
    //**************************************************************************
    @objc func handlePrevButton(button: UIButton) {
        
        let vProg = view.viewWithTag(BTN_AD_PAGE_VIEW) as! UIPageControl
        vProg.currentPage -= 1
        
        let vDescription = view.viewWithTag(BTN_AD_LBL_WEAPON) as! UILabel
        vDescription.text = defenseNamesAdd[vProg.currentPage]
    }
    //**************************************************************************
}
