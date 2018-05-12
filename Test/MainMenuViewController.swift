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
        
        designer.addLabel(vTitle: "This is the HUD", vTag: 0, vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: 0, vSubY: 0, vInvertColors: false, vhasFrame: false)
        
        designer.addButton(vTitle: "Add Defense",      vTag: BTN_MAIN_ADD_DEFENSE,     vAlignText: .center, vAlignX: .center, vAlignY: .center, vWidth: 300, vHeight: 100, vSubX: nil, vSubY: nil)
        designer.addButton(vTitle: "Upgrade Defense",  vTag: BTN_MAIN_UPGRADE_DEFENSE, vAlignText: .center, vAlignX: .center, vAlignY: .below,  vWidth: 300, vHeight: 100, vSubX: nil, vSubY: BTN_MAIN_ADD_DEFENSE)
        
        let vAddDefense = view.viewWithTag(BTN_MAIN_ADD_DEFENSE) as! UIButton
        vAddDefense.addTarget(self, action: #selector(handleMainMenu(button:)), for: .touchUpInside)
        
        let vAdUpgradeDefense = view.viewWithTag(BTN_MAIN_UPGRADE_DEFENSE) as! UIButton
        vAdUpgradeDefense.addTarget(self, action: #selector(handleMainMenu(button:)), for: .touchUpInside)
        
    }
    //**************************************************************************
    @objc func handleMainMenu(button: UIButton) {
        switch button.tag
        {
            case BTN_MAIN_ADD_DEFENSE:
                MainMenuViewController().dismiss(animated: true, completion: nil)
                present(AddDefenseVC(), animated: true, completion: nil)
            break
            case BTN_MAIN_UPGRADE_DEFENSE:
                MainMenuViewController().dismiss(animated: true, completion: nil)
                present(UpgradeDefenseVC(), animated: true, completion: nil)
            break
        default:
            break
        }
    }
    //**************************************************************************
}

