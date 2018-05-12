import UIKit

// Menu Main
let BTN_MAIN_ADD_DEFENSE     = 12000
let BTN_MAIN_UPGRADE_DEFENSE = 12001

//**************************************************************************
enum menuReturnTypes
{
    case menuSelected, menuBack, menuNone, menuNewGame, menuSavedGames, menuHighScores, menuDefensePreview, menuEnemyPreview, menuHelp
}
//**************************************************************************
class MainMenuViewController: UIViewController
{
    var lblHUD = UILabel()
    var btnAddDefense = UIButton()
    var btnUpgDefense = UIButton()
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Menu"
        view.backgroundColor = .black
        
        let designer = UIDesigner.init(vView: view)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        lblHUD = designer.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        
        btnAddDefense = designer.addButton(vTitle: "Add Defense    ", vAlignText: .center)
        btnUpgDefense = designer.addButton(vTitle: "Upgrade Defense", vAlignText: .center)
            
        // Add Alignments
        designer.addAlignment(vView: lblHUD,        vAlignX: .center, vAlignY: .top,    vWidth: 200, vHeight: 30,  vSubX: nil, vSubY: nil)
        designer.addAlignment(vView: btnAddDefense, vAlignX: .center, vAlignY: .center, vWidth: 300, vHeight: 100, vSubX: nil, vSubY: nil)
        designer.addAlignment(vView: btnUpgDefense, vAlignX: .center, vAlignY: .below,  vWidth: 300, vHeight: 100, vSubX: nil, vSubY: btnAddDefense)
        
        // Add Actions
        btnAddDefense.addTarget(self, action: #selector(handleAddDefenseMenu(button:)), for: .touchUpInside)
        btnUpgDefense.addTarget(self, action: #selector(handleUpgDefenseMenu(button:)), for: .touchUpInside)
        
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
}

