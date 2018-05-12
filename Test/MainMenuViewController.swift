import UIKit

//**************************************************************************
enum menuReturnTypes
{
    case menuSelected, menuBack, menuNone, menuNewGame, menuSavedGames, menuHighScores, menuDefensePreview, menuEnemyPreview, menuHelp
}
//**************************************************************************
class MainMenuViewController: UIViewController
{
    var uid = UIDesigner()
    
    var lblHUD = UILabel()
    var btnAddDefense = UIButton()
    var btnUpgDefense = UIButton()
    var btnHud = UIButton()
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Menu"
        view.backgroundColor = .black
        
        uid.initView(vView: view)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        lblHUD = uid.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        
        btnAddDefense = uid.addButton(vTitle: "Add Defense    ", vAlignText: .center)
        btnUpgDefense = uid.addButton(vTitle: "Upgrade Defense", vAlignText: .center)
        btnHud        = uid.addButton(vTitle: "Hud Menu", vAlignText: .center)
            
        // Add Alignments
        uid.addAlignment(vView: lblHUD,        vAlignX: .center, vAlignY: .top,    vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        uid.addAlignment(vView: btnUpgDefense, vAlignX: .center, vAlignY: .center, vWidth: 300, vHeight: 75, vSubX: nil, vSubY: nil)
        uid.addAlignment(vView: btnAddDefense, vAlignX: .center, vAlignY: .above,  vWidth: 300, vHeight: 75, vSubX: nil, vSubY: btnUpgDefense)
        uid.addAlignment(vView: btnHud,        vAlignX: .center, vAlignY: .below,  vWidth: 300, vHeight: 75, vSubX: nil, vSubY: btnUpgDefense)
        
        // Add Actions
        btnAddDefense.addTarget(self, action: #selector(handleAddDefenseMenu(button:)), for: .touchUpInside)
        btnUpgDefense.addTarget(self, action: #selector(handleUpgDefenseMenu(button:)), for: .touchUpInside)
        btnHud.addTarget(self, action: #selector(handleHudMenu(button:)), for: .touchUpInside)
    }
    //**************************************************************************
    @objc func handleAddDefenseMenu(button: UIButton) {
                MainMenuViewController().dismiss(animated: true, completion: nil)
                present(AddDefenseVC(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleUpgDefenseMenu(button: UIButton) {
        MainMenuViewController().dismiss(animated: true, completion: nil)
                present(UpgradeDefenseVC(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleHudMenu(button: UIButton) {
        MainMenuViewController().dismiss(animated: true, completion: nil)
        present(HudVC(), animated: true, completion: nil)
    }
    //**************************************************************************
}

