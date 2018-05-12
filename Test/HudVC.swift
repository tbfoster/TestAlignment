
import UIKit

//**************************************************************************
class HudVC: UIViewController
{
    var btnBack = UIButton()
    var btnQuit = UIButton()
    var btnRiserMode = UIButton()
    var btnResetView = UIButton()
    var btnZoomIn = UIButton()
    var btnZoomOut = UIButton()
    
    var lblHUD = UILabel()
    var riserMode: Bool = false
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
        
        let vResetViewX = UIScreen.main.bounds.width * 0.305
        let vRiserModeX = UIScreen.main.bounds.width * 0.305
        let vBackX   = UIScreen.main.bounds.width * 0.15
        let vDefaultY = UIScreen.main.bounds.width * 0.10
        
        // Add buttons
        btnBack      = designer.addButton(vTitle: "Back", vAlignText: .center)
        btnQuit      = designer.addButton(vTitle: "Quit", vAlignText: .center)
        btnRiserMode = designer.addButton(vTitle: "Riser Mode Off", vAlignText: .center)
        btnResetView = designer.addButton(vTitle: "Reset View", vAlignText: .center)
        btnZoomIn    = designer.addButton(vTitle: "Zoom ++", vAlignText: .center)
        btnZoomOut   = designer.addButton(vTitle: "Zoom --", vAlignText: .center)
        // Add Labels
        lblHUD    = designer.addLabel(vTitle: "This is the HUD", vAlignText: .center, vInvertColors: false, vhasFrame: false)
        
        // Align all components
        designer.addAlignment(vView: lblHUD,    vAlignX: .center, vAlignY: .top, vWidth: 200, vHeight: 30, vSubX: nil, vSubY: nil)
        
        designer.addAlignment(vView: btnRiserMode, vAlignX: .center,   vAlignY: .center, vWidth: vRiserModeX, vHeight: vDefaultY, vSubX: nil,          vSubY: nil)
        designer.addAlignment(vView: btnResetView, vAlignX: .center,   vAlignY: .below,  vWidth: vResetViewX, vHeight: vDefaultY, vSubX: nil,          vSubY: btnRiserMode)
        designer.addAlignment(vView: btnZoomIn,    vAlignX: .leftOf,   vAlignY: .below,  vWidth: vBackX,      vHeight: vDefaultY, vSubX: btnResetView, vSubY: btnRiserMode)
        designer.addAlignment(vView: btnZoomOut,   vAlignX: .rightOf,  vAlignY: .below,  vWidth: vBackX,      vHeight: vDefaultY, vSubX: btnResetView, vSubY: btnRiserMode)
        designer.addAlignment(vView: btnBack,      vAlignX: .leftEven, vAlignY: .above,  vWidth: vBackX,      vHeight: vDefaultY, vSubX: btnRiserMode, vSubY: btnRiserMode)
        designer.addAlignment(vView: btnQuit,      vAlignX: .rightOf,  vAlignY: .above,  vWidth: vBackX,      vHeight: vDefaultY, vSubX: btnBack,      vSubY: btnRiserMode)
        
        // Add Actions
        btnBack.addTarget(self, action: #selector(handleBackButton(button:)), for: .touchUpInside)
        btnRiserMode.addTarget(self, action: #selector(handleRiserButton(button:)), for: .touchUpInside)
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
        UpgradeDefenseVC().dismiss(animated: true, completion: nil)
        present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleRiserButton(button: UIButton) {
        riserMode = !riserMode
        if(riserMode == true)
        {
            btnRiserMode.setTitle("💢 Riser Mode", for: .normal)
        }
        else
        {
            btnRiserMode.setTitle("Riser Mode Off", for: .normal)
        }
    }
    //**************************************************************************
}
