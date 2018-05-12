import UIKit

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

//**************************************************************************
class AddDefenseVC: UIViewController
{
    var uid = UIDesigner()
    
    var btnBack = UIButton()
    var btnSelect = UIButton()
    var btnNext = UIButton()
    var btnPrev = UIButton()
    var btnRiser = UIButton()
    
    var lblHUD = UILabel()
    var lblInvent = UILabel()
    var lblCost = UILabel()
    var lblWeapon = UILabel()
    var lblReload = UILabel()
    var lblPower = UILabel()
    var lblShields = UILabel()
    
    var lblReloadProgress = UIProgressView()
    var lblPowerProgress = UIProgressView()
    var lblShieldsProgress = UIProgressView()
    
    var pageControl = UIPageControl()
    
    var selectIndex: Int = 0
    var selectIndexMax: Int = 4
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        uid.initView(vView: view)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let vSelectX = UIScreen.main.bounds.width * 0.72
        let vSelectY = UIScreen.main.bounds.height * 0.50
        
        let vNextX = UIScreen.main.bounds.width * 0.12
        let vNextY = vSelectY / 2
        
        let vProgX = UIScreen.main.bounds.height * 0.28
        let vProgY = UIScreen.main.bounds.height * 0.01
        
        let vBackX   = UIScreen.main.bounds.width * 0.15
        let vRiserX   = UIScreen.main.bounds.width * 0.56
        let vDefaultY = UIScreen.main.bounds.width * 0.08
        let vShieldsX = UIScreen.main.bounds.width * 0.23
        let vShieldsY = UIScreen.main.bounds.width * 0.05
        
        // Add buttons
        btnSelect = uid.addButton(vTitle: "", vAlignText: .center)
        btnNext   = uid.addButton(vTitle: "Next", vAlignText: .center)
        btnPrev   = uid.addButton(vTitle: "Prev", vAlignText: .center)
        btnBack   = uid.addButton(vTitle: "Back", vAlignText: .center)
        btnRiser  = uid.addButton(vTitle: "Add Riser", vAlignText: .center)
        // Add Labels
        lblHUD    = uid.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblWeapon  = uid.addLabel(vTitle: "Iodone Laser 20Kb", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblInvent  = uid.addLabel(vTitle: "Avail: 9", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblCost    = uid.addLabel(vTitle: "💰 300", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        
        lblShields = uid.addLabel(vTitle: "Shields",           vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblReload  = uid.addLabel(vTitle: "Reload",            vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblPower   = uid.addLabel(vTitle: "Power",             vAlignText: .center, vInvertColors: false, vhasFrame: true)
        // Add Progress Bars
        lblShieldsProgress = uid.addProgressBar(vProgress: 0.25)
        lblReloadProgress  = uid.addProgressBar(vProgress: 0.45)
        lblPowerProgress   = uid.addProgressBar(vProgress: 0.85)
        // Add Page Control
        pageControl = uid.addPageControl(vStartPage: 0, vMaxPages: 5)
        
        // Align all components
        uid.addAlignment(vView: lblHUD,    vAlignX: .center,  vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        
        uid.addAlignment(vView: btnSelect, vAlignX: .center,  vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY,  vSubX: nil,       vSubY: nil)
        uid.addAlignment(vView: btnNext,   vAlignX: .rightOf, vAlignY: .center, vWidth: vNextX,   vHeight: vNextY,    vSubX: btnSelect, vSubY: nil)
        uid.addAlignment(vView: btnPrev,   vAlignX: .leftOf,  vAlignY: .center, vWidth: vNextX,   vHeight: vNextY,    vSubX: btnSelect, vSubY: nil)
        uid.addAlignment(vView: btnBack,   vAlignX: .rightOf, vAlignY: .above,  vWidth: vBackX,   vHeight: vDefaultY, vSubX: btnPrev,   vSubY: btnSelect)
        uid.addAlignment(vView: btnRiser,  vAlignX: .rightOf, vAlignY: .above,  vWidth: vRiserX,  vHeight: vDefaultY, vSubX: btnBack,   vSubY: btnSelect)
        
        uid.addAlignment(vView: lblWeapon, vAlignX: .center,      vAlignY: .aboveInside, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: btnSelect)
        uid.addAlignment(vView: lblInvent, vAlignX: .leftInside,  vAlignY: .belowInside, vWidth: vShieldsX, vHeight: 0, vSubX: btnSelect, vSubY: btnSelect)
        uid.addAlignment(vView: lblCost,   vAlignX: .rightInside, vAlignY: .belowInside, vWidth: vShieldsX, vHeight: 0, vSubX: btnSelect, vSubY: btnSelect)
        
        uid.addAlignment(vView: lblReload,  vAlignX: .center,  vAlignY: .below, vWidth: vShieldsX, vHeight: vShieldsY, vSubX: nil,       vSubY: btnSelect)
        uid.addAlignment(vView: lblShields, vAlignX: .leftOf,  vAlignY: .below, vWidth: vShieldsX, vHeight: vShieldsY, vSubX: lblReload, vSubY: btnSelect)
        uid.addAlignment(vView: lblPower,   vAlignX: .rightOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vShieldsY, vSubX: lblReload, vSubY: btnSelect)
        
        uid.addAlignment(vView: lblShieldsProgress, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblShields, vSubY: lblShields)
        uid.addAlignment(vView: lblReloadProgress,  vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblReload,  vSubY: lblReload)
        uid.addAlignment(vView: lblPowerProgress,   vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblPower,   vSubY: lblPower)
        
        uid.addAlignment(vView: pageControl, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        
        // Add Actions
        btnBack.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
        btnNext.addTarget(self, action: #selector(handleNextButton(button:)), for: .touchUpInside)
        btnPrev.addTarget(self, action: #selector(handlePrevButton(button:)), for: .touchUpInside)
        
        initButtonValues()
    }
    //**************************************************************************
    func initButtonValues()
    {
        setTestValues()
    }
    //**************************************************************************
    func setTestValues()
    {
        switch(pageControl.currentPage)
        {
        case 0:
            uid.enable(vView: btnSelect)
            uid.enable(vView: lblWeapon)
            uid.enable(vView: lblInvent)
            uid.enable(vView: lblCost)
            break
        case 1:
            uid.disable(vView: btnSelect)
            uid.disable(vView: lblWeapon)
            uid.enable(vView: lblInvent)
            uid.disable(vView: lblCost)
            break
        case 2:
            uid.disable(vView: btnSelect)
            uid.disable(vView: lblWeapon)
            uid.disable(vView: lblInvent)
            uid.enable(vView: lblCost)
            break
        case 3:
            uid.disable(vView: btnSelect)
            uid.disable(vView: lblWeapon)
            uid.disable(vView: lblInvent)
            uid.disable(vView: lblCost)
        case 4:
            uid.disable(vView: btnSelect)
            uid.disable(vView: lblWeapon)
            uid.disable(vView: lblInvent)
            uid.disable(vView: lblCost)
        default:
            break
        }
        
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
        AddDefenseVC().dismiss(animated: true, completion: nil)
        present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleNextButton(button: UIButton) {
        selectIndex += 1
        if(selectIndex > selectIndexMax)
        {
            selectIndex = 0
        }
        pageControl.currentPage = selectIndex
        lblWeapon.text = defenseNamesAdd[selectIndex]
        setTestValues()
    }
    //**************************************************************************
    @objc func handlePrevButton(button: UIButton) {
        selectIndex -= 1
        if(selectIndex < 0)
        {
            selectIndex = selectIndexMax
        }
        pageControl.currentPage = selectIndex
        lblWeapon.text = defenseNamesAdd[selectIndex]
        setTestValues()
    }
    //**************************************************************************
}
