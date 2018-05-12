import UIKit

//**************************************************************************
class UpgradeDefenseVC: UIViewController
{
    var uid = UIDesigner()
    
    var btnBack = UIButton()
    var btnSelect = UIButton()
    var btnRepair = UIButton()
    var btnRemove = UIButton()
    
    var lblHUD = UILabel()
    var lblWeapon = UILabel()
    var lblReload = UILabel()
    var lblPower = UILabel()
    var lblShields = UILabel()
    
    var lblReloadProgress = UIProgressView()
    var lblPowerProgress = UIProgressView()
    var lblShieldsProgress = UIProgressView()
    
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
        
        let vWeapX = UIScreen.main.bounds.width * 0.69
        let vProgX = UIScreen.main.bounds.height * 0.28
        let vProgY = UIScreen.main.bounds.height * 0.02
        
        let vBackX   = UIScreen.main.bounds.width * 0.15
        let vRemoveX   = UIScreen.main.bounds.width * 0.28
        let vDefaultY = UIScreen.main.bounds.width * 0.08
        let vShieldsX = UIScreen.main.bounds.width * 0.23
        
        // Add buttons
        btnSelect  = uid.addButton(vTitle: "💥 Select", vAlignText: .center)
        btnBack    = uid.addButton(vTitle: "Back", vAlignText: .center)
        btnRemove  = uid.addButton(vTitle: "❌ Remove", vAlignText: .center)
        btnRepair  = uid.addButton(vTitle: "☢️ Repair", vAlignText: .center)
        // Add Labels
        lblHUD     = uid.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblWeapon  = uid.addLabel(vTitle: "Iodone Laser 20Kb", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblShields = uid.addLabel(vTitle: "Shields",           vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblReload  = uid.addLabel(vTitle: "Reload",            vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblPower   = uid.addLabel(vTitle: "Power",             vAlignText: .center, vInvertColors: false, vhasFrame: true)
        // Add Progress Bars
        lblShieldsProgress = uid.addProgressBar(vProgress: 0.25)
        lblReloadProgress  = uid.addProgressBar(vProgress: 0.45)
        lblPowerProgress   = uid.addProgressBar(vProgress: 0.85)
        
        // Align all components
        uid.addAlignment(vView: lblHUD,    vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        
        uid.addAlignment(vView: btnSelect, vAlignX: .center, vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY,  vSubX: nil,       vSubY: nil)
        
        uid.addAlignment(vView: btnBack,   vAlignX: .leftEven, vAlignY: .above,  vWidth: vBackX,   vHeight: vDefaultY, vSubX: btnSelect, vSubY: btnSelect)
        uid.addAlignment(vView: btnRemove, vAlignX: .rightOf,  vAlignY: .above,  vWidth: vRemoveX, vHeight: vDefaultY, vSubX: btnBack,   vSubY: btnSelect)
        uid.addAlignment(vView: btnRepair, vAlignX: .rightOf,  vAlignY: .above,  vWidth: vRemoveX, vHeight: vDefaultY, vSubX: btnRemove,   vSubY: btnSelect)
        
        uid.addAlignment(vView: lblWeapon, vAlignX: .center, vAlignY: .aboveInside, vWidth: vWeapX, vHeight: 0, vSubX: nil, vSubY: btnSelect)
        
        uid.addAlignment(vView: lblReload,  vAlignX: .center,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: nil,       vSubY: btnSelect)
        uid.addAlignment(vView: lblShields, vAlignX: .leftOf,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        uid.addAlignment(vView: lblPower,   vAlignX: .rightOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        
        uid.addAlignment(vView: lblShieldsProgress, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblShields, vSubY: lblShields)
        uid.addAlignment(vView: lblReloadProgress,  vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblReload,  vSubY: lblReload)
        uid.addAlignment(vView: lblPowerProgress,   vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblPower,   vSubY: lblPower)
        
        // Add Actions
        btnBack.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
            UpgradeDefenseVC().dismiss(animated: true, completion: nil)
            present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
}
