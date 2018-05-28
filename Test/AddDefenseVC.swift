import UIKit

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

//**************************************************************************
class AddDefenseVC: UIViewController
{
    var uid = UIDesigner()
    
    var btnSelect = UIButton()
    var btnSelect2 = UIButton()
    var testCustom: UICustomProgressView
    
    //**************************************************************************
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        testCustom = UICustomProgressView.init(vRect: CGRect(x: 0, y: 0, width: 200, height: 80))
        super.init(nibName: nil, bundle: nil)
    }
    //**************************************************************************
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        uid.initView(vView: view)
        
        btnSelect  = uid.addButton(vTitle: "Select1", vAlignText: .center)
        uid.addAlignment(vView: btnSelect, vAlignX: .center, vAlignY: .center, vWidth: 0, vHeight: 0,  vSubX: nil,       vSubY: nil)
        btnSelect.addTarget(self, action: #selector(handleSelect1Button(button:)), for: .touchUpInside)
        
        btnSelect2  = uid.addButton(vTitle: "Select2", vAlignText: .center)
        uid.addAlignment(vView: btnSelect2, vAlignX: .center, vAlignY: .below, vWidth: 0, vHeight: 0,  vSubX: nil,       vSubY: btnSelect)
        btnSelect2.addTarget(self, action: #selector(handleSelect2Button(button:)), for: .touchUpInside)
        
        view.addSubview(testCustom)
        testCustom.setProgress(vProgress: 0.45)
        
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    //**************************************************************************
    @objc func handleSelect1Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.80)
    }
    //**************************************************************************
    @objc func handleSelect2Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.20)
    }
    //**************************************************************************
}
