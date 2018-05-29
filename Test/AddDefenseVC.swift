import UIKit

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

//**************************************************************************
class AddDefenseVC: UIViewController
{
    var data = Data.sharedInstance
    var uid = UIDesigner()
    
    var btnSelect = UIButton()
    var btnSelect2 = UIButton()
    var testCustom = UICustomProgressView()
    var testCustom2 = UICustomProgressView()
    var testCustom3 = UICustomProgressView()
    
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        uid.initView(vView: view, vGroupTag: 2000)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.defaultGame]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        checkOrientation(vWidth: view.bounds.width, vHeight: view.bounds.height)
        
        btnSelect  = uid.addButton(vTitle: "Select1", vAlignText: .center)
        btnSelect2 = uid.addButton(vTitle: "Select2", vAlignText: .center)
        
        uid.align(vView: btnSelect,  horz: .center, vert: .topMargin, widthPct: 0.80, heightPct: 0.15, subX: nil, subY: nil)
        uid.align(vView: btnSelect2, horz: .center, vert: .below,     widthPct: 0.40, heightPct: 0.08, subX: nil, subY: btnSelect)
        
        let vFont = UIFont.boldSystemFont(ofSize: 32)
        testCustom.initView(vDesc: "Reload", vBackground: UIColor.black, vBorder: UIColor.gray, vNormal: UIColor.blue, vMasked: UIColor.white, vShade: UIColor.blue, vFont: vFont, vImage: "BackgroundReload.png")
        view.addSubview(testCustom)
        testCustom.resize(hAlign: .center, vAlign: .below, vWidth: 0.33, vHeight: 0.08, vSubX: view, vSubY: btnSelect2)
        testCustom.setProgress(vProgress: 0.15)
        
        testCustom2.initView(vDesc: "Power", vBackground: UIColor.white, vBorder: UIColor.darkGray, vNormal: UIColor.blue, vMasked: UIColor.white, vShade: UIColor.blue, vFont: vFont, vImage: "BackgroundPower.png")
        view.addSubview(testCustom2)
        testCustom2.resize(hAlign: .rightInside, vAlign: .below, vWidth: 0.33, vHeight: 0.08, vSubX: btnSelect, vSubY: btnSelect2)
        testCustom2.setProgress(vProgress: 0.45)
        
        testCustom3.initView(vDesc: "Shields", vBackground: UIColor.black, vBorder: UIColor.lightGray, vNormal: UIColor.yellow, vMasked: UIColor.black, vShade: UIColor.yellow, vFont: vFont, vImage: "BackgroundShields.png")
        view.addSubview(testCustom3)
        testCustom3.resize(hAlign: .leftEven, vAlign: .below, vWidth: 0.33, vHeight: 0.08, vSubX: btnSelect, vSubY: btnSelect2)
        testCustom3.setProgress(vProgress: 0.45)
        
        btnSelect.addTarget(self, action: #selector(handleSelect1Button(button:)), for: .touchUpInside)
        btnSelect2.addTarget(self, action: #selector(handleSelect2Button(button:)), for: .touchUpInside)
        
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
//            NSLayoutConstraint.deactivate(data.landscapeConstraints)
//            NSLayoutConstraint.activate(data.portraitConstraints)
        }
    }
    //**************************************************************************
    @objc func handleSelect1Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.95)
        testCustom2.setProgress(vProgress: 1.0)
        testCustom3.setProgress(vProgress: 1.0)
    }
    //**************************************************************************
    @objc func handleSelect2Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.20)
        testCustom2.setProgress(vProgress: 0.32)
        testCustom3.setProgress(vProgress: 0.12)
    }
    //**************************************************************************
}
