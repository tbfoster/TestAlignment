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
    var btnBack = UIButton()
    var btnSelect = UIButton()
    var btnNext = UIButton()
    var btnPrev = UIButton()
    var btnRiser = UIButton()
    
    var lblHUD = UILabel()
    var lblInvent = UILabel()
    var lblWeapon = UILabel()
    var lblReload = UILabel()
    var lblPower = UILabel()
    var lblShields = UILabel()
    
    var lblReloadProgress = UIProgressView()
    var lblPowerProgress = UIProgressView()
    var lblShieldsProgress = UIProgressView()
    
    var pageControl = UIPageControl()
    
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
        let vDefaultY = UIScreen.main.bounds.width * 0.08
        let vShieldsX = UIScreen.main.bounds.width * 0.23
        
        // Add buttons
        btnSelect = designer.addButton(vTitle: "💥 Select", vAlignText: .center)
        btnNext   = designer.addButton(vTitle: "Next", vAlignText: .center)
        btnPrev   = designer.addButton(vTitle: "Prev", vAlignText: .center)
        btnBack   = designer.addButton(vTitle: "Back", vAlignText: .center)
        btnRiser  = designer.addButton(vTitle: "Add Riser", vAlignText: .center)
        // Add Labels
        lblHUD    = designer.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblWeapon  = designer.addLabel(vTitle: "Iodone Laser 20Kb", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblInvent  = designer.addLabel(vTitle: "Inventory 9 of 31", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblShields = designer.addLabel(vTitle: "Shields",           vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblReload  = designer.addLabel(vTitle: "Reload",            vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblPower   = designer.addLabel(vTitle: "Power",             vAlignText: .center, vInvertColors: false, vhasFrame: true)
        // Add Progress Bars
        lblShieldsProgress = designer.addProgressBar(vProgress: 0.25)
        lblReloadProgress  = designer.addProgressBar(vProgress: 0.45)
        lblPowerProgress   = designer.addProgressBar(vProgress: 0.85)
        // Add Page Control
        pageControl = designer.addPageControl(vStartPage: 0, vMaxPages: 5)
        
        // Align all components
        designer.addAlignment(vView: lblHUD,    vAlignX: .center,  vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        
        designer.addAlignment(vView: btnSelect, vAlignX: .center,  vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY,  vSubX: nil,       vSubY: nil)
        designer.addAlignment(vView: btnNext,   vAlignX: .rightOf, vAlignY: .center, vWidth: vNextX,   vHeight: vNextY,    vSubX: btnSelect, vSubY: nil)
        designer.addAlignment(vView: btnPrev,   vAlignX: .leftOf,  vAlignY: .center, vWidth: vNextX,   vHeight: vNextY,    vSubX: btnSelect, vSubY: nil)
        designer.addAlignment(vView: btnBack,   vAlignX: .rightOf, vAlignY: .above,  vWidth: vBackX,   vHeight: vDefaultY, vSubX: btnPrev,   vSubY: btnSelect)
        designer.addAlignment(vView: btnRiser,  vAlignX: .rightOf, vAlignY: .above,  vWidth: vRiserX,  vHeight: vDefaultY, vSubX: btnBack,   vSubY: btnSelect)
        
        designer.addAlignment(vView: lblWeapon, vAlignX: .center,  vAlignY: .aboveInside, vWidth: vWeapX, vHeight: 0, vSubX: nil, vSubY: btnSelect)
        designer.addAlignment(vView: lblInvent, vAlignX: .center,  vAlignY: .belowInside, vWidth: 0,      vHeight: 0, vSubX: nil, vSubY: btnSelect)
        
        designer.addAlignment(vView: lblReload,  vAlignX: .center,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: nil,       vSubY: btnSelect)
        designer.addAlignment(vView: lblShields, vAlignX: .leftOf,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        designer.addAlignment(vView: lblPower,   vAlignX: .rightOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        
        designer.addAlignment(vView: lblShieldsProgress, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: lblShields, vSubY: lblShields)
        designer.addAlignment(vView: lblReloadProgress,  vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: lblReload,  vSubY: lblReload)
        designer.addAlignment(vView: lblPowerProgress,   vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgXL, vHeight: vProgYInd, vSubX: lblPower,   vSubY: lblPower)
        
        designer.addAlignment(vView: pageControl, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        
        // Add Actions
        btnBack.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(handleNextButton(button:)), for: .touchUpInside)
        btnPrev.addTarget(self, action: #selector(handlePrevButton(button:)), for: .touchUpInside)
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
        AddDefenseVC().dismiss(animated: true, completion: nil)
        present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleNextButton(button: UIButton) {
        pageControl.currentPage += 1
        lblWeapon.text = defenseNamesAdd[pageControl.currentPage]
    }
    //**************************************************************************
    @objc func handlePrevButton(button: UIButton) {
        pageControl.currentPage -= 1
        lblWeapon.text = defenseNamesAdd[pageControl.currentPage]
    }
    //**************************************************************************
}
