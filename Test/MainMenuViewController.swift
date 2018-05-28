import UIKit

//**************************************************************************
enum menuReturnTypes
{
    case menuSelected, menuBack, menuNone, menuNewGame, menuSavedGames, menuHighScores, menuDefensePreview, menuEnemyPreview, menuHelp
}
//**************************************************************************
class MainMenuViewController: UIViewController
{
    var data = Data.sharedInstance
    var uid = UIDesigner()
    
    var btnAddDefense = UIButton()
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Menu"
        view.backgroundColor = .black
        
        uid.initView(vView: view, vGroupTag: 1000)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.defaultGame]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        checkOrientation(vWidth: view.bounds.width, vHeight: view.bounds.height)
        
        btnAddDefense = uid.addButton(vTitle: "Add Defense", vAlignText: .center)
       
        // Add Alignments
        uid.align(vView: btnAddDefense, horz: .center, vert: .center, widthPct: 0.80, heightPct: 0.12, subX: nil, subY: nil)
        
        // Add Actions
        btnAddDefense.addTarget(self, action: #selector(handleAddDefenseMenu(button:)), for: .touchUpInside)
        resize()
    }
    //**************************************************************************
    func checkOrientation(vWidth: CGFloat, vHeight: CGFloat)
    {
        if(vWidth < vHeight)
        {
            data.landscape = false
            data.landscapeScreenWidth = vHeight
            data.landscapeScreenHeight = vWidth
            
            data.portraitScreenWidth = vWidth
            data.portraitScreenHeight = vHeight
        }
        else
        {
            data.landscape = true
            data.landscapeScreenWidth = vWidth
            data.landscapeScreenHeight = vHeight
            
            data.portraitScreenWidth = vHeight
            data.portraitScreenHeight = vWidth
        }
    }
    //**************************************************************************
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        checkOrientation(vWidth: size.width, vHeight: size.height)
        resize()
    }
    //**************************************************************************
    func resize()
    {
        if(data.landscape == true)
        {
            //print("Landscape()")
            NSLayoutConstraint.deactivate(data.portraitConstraints)
            NSLayoutConstraint.activate(data.landscapeConstraints)
        }
        else
        {
            //print("Portrait()")
            NSLayoutConstraint.deactivate(data.landscapeConstraints)
            NSLayoutConstraint.activate(data.portraitConstraints)
        }
    }
    //**************************************************************************
    @objc func handleAddDefenseMenu(button: UIButton) {
                MainMenuViewController().dismiss(animated: true, completion: nil)
                present(AddDefenseVC(), animated: true, completion: nil)
    }
    //**************************************************************************
}

