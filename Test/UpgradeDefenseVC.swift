import UIKit

//**************************************************************************
class UpgradeDefenseVC: UIViewController
{
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
        
        let designer = UIDesigner.init(vView: view)
        
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
        btnSelect = designer.addButton(vTitle: "💥 Select", vAlignText: .center)
        btnBack   = designer.addButton(vTitle: "Back", vAlignText: .center)
        btnRemove = designer.addButton(vTitle: "❌ Remove", vAlignText: .center)
        btnRepair = designer.addButton(vTitle: "☢️ Repair", vAlignText: .center)
        // Add Labels
        lblHUD    = designer.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblWeapon  = designer.addLabel(vTitle: "Iodone Laser 20Kb", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        lblShields = designer.addLabel(vTitle: "Shields",           vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblReload  = designer.addLabel(vTitle: "Reload",            vAlignText: .center, vInvertColors: false, vhasFrame: true)
        lblPower   = designer.addLabel(vTitle: "Power",             vAlignText: .center, vInvertColors: false, vhasFrame: true)
        // Add Progress Bars
        lblShieldsProgress = designer.addProgressBar(vProgress: 0.25)
        lblReloadProgress  = designer.addProgressBar(vProgress: 0.45)
        lblPowerProgress   = designer.addProgressBar(vProgress: 0.85)
        
        // Align all components
        designer.addAlignment(vView: lblHUD,    vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        
        designer.addAlignment(vView: btnSelect, vAlignX: .center, vAlignY: .center, vWidth: vSelectX, vHeight: vSelectY,  vSubX: nil,       vSubY: nil)
        
        designer.addAlignment(vView: btnBack,   vAlignX: .leftEven, vAlignY: .above,  vWidth: vBackX,   vHeight: vDefaultY, vSubX: btnSelect, vSubY: btnSelect)
        designer.addAlignment(vView: btnRemove, vAlignX: .rightOf,  vAlignY: .above,  vWidth: vRemoveX, vHeight: vDefaultY, vSubX: btnBack,   vSubY: btnSelect)
        designer.addAlignment(vView: btnRepair, vAlignX: .rightOf,  vAlignY: .above,  vWidth: vRemoveX, vHeight: vDefaultY, vSubX: btnRemove,   vSubY: btnSelect)
        
        designer.addAlignment(vView: lblWeapon, vAlignX: .center, vAlignY: .aboveInside, vWidth: vWeapX, vHeight: 0, vSubX: nil, vSubY: btnSelect)
        
        designer.addAlignment(vView: lblReload,  vAlignX: .center,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: nil,       vSubY: btnSelect)
        designer.addAlignment(vView: lblShields, vAlignX: .leftOf,  vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        designer.addAlignment(vView: lblPower,   vAlignX: .rightOf, vAlignY: .below, vWidth: vShieldsX, vHeight: vDefaultY, vSubX: lblReload, vSubY: btnSelect)
        
        designer.addAlignment(vView: lblShieldsProgress, vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblShields, vSubY: lblShields)
        designer.addAlignment(vView: lblReloadProgress,  vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblReload,  vSubY: lblReload)
        designer.addAlignment(vView: lblPowerProgress,   vAlignX: .leftInside, vAlignY: .belowInside, vWidth: vProgX, vHeight: vProgY, vSubX: lblPower,   vSubY: lblPower)
        
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
