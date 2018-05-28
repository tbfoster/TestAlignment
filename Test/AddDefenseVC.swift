import UIKit

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

//**************************************************************************
class AddDefenseVC: UIViewController
{
    var data = Data.sharedInstance
    var uid = UIDesigner()
    
    var btnSelect = UIButton()
    var btnSelect2 = UIButton()
    var testCustom: UICustomProgressView
    var lblShields = ProgressBar()
    
    //**************************************************************************
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        testCustom = UICustomProgressView.init(vRect: CGRect(x: 100, y: 0, width: 200, height: 80))
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
        
        uid.initView(vView: view, vGroupTag: 2000)
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.defaultGame]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        checkOrientation(vWidth: view.bounds.width, vHeight: view.bounds.height)
        
        btnSelect  = uid.addButton(vTitle: "Select1", vAlignText: .center)
        btnSelect2 = uid.addButton(vTitle: "Select2", vAlignText: .center)
        lblShields = uid.addProgressBar(vProgress: 0.60)
        
        uid.align(vView: btnSelect,  horz: .center, vert: .topMargin, widthPct: 0.80, heightPct: 0.15, subX: nil, subY: nil)
        uid.align(vView: btnSelect2, horz: .center, vert: .below,     widthPct: 0.80, heightPct: 0.15, subX: nil, subY: btnSelect)
        uid.align(vView: lblShields, horz: .center, vert: .below,     widthPct: 0.80, heightPct: 0.20, subX: nil, subY: btnSelect2)
        lblShields.addAllConstraints()
        //uid.align(vView: lblShields.maskedProgressLabel, horz: .leftInside, vert: .belowInside, widthPct: 0.25, heightPct: 0.15, subX: lblShields.container, subY: lblShields.container)
        //lblShields.addAllConstraints()
        
        btnSelect.addTarget(self, action: #selector(handleSelect1Button(button:)), for: .touchUpInside)
        btnSelect2.addTarget(self, action: #selector(handleSelect2Button(button:)), for: .touchUpInside)
        
        view.addSubview(testCustom)
        testCustom.test(vRect: CGRect(x: 300, y: 400, width: 400, height: 120))
        testCustom.addAllConstraints()
        testCustom.setProgress(vProgress: 0.45)
        
        //testCustom.test(vRect: CGRect(x: 100, y: 200, width: 200, height: 80))
        
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
    @objc func handleSelect1Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.80)
        lblShields.setProgress(vProgress: 0.86)
    }
    //**************************************************************************
    @objc func handleSelect2Button(button: UIButton) {
        testCustom.setProgress(vProgress: 0.20)
        lblShields.setProgress(vProgress: 0.26)
    }
    //**************************************************************************
}
