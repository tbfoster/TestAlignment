import UIKit

let defenseNamesAdd:[Int: String] = [0:"Chlorine Laser 20kW", 1:"Iodine Laser 80kW", 2:"Argon Plasma 1.5 MW", 3:"SSM-Pounder Mark 1", 4:"Air Missiles - LFC"]

//**************************************************************************
class AddDefenseVC: UIViewController
{
    var uid = UIDesigner()
    
    var testCustom: UICustomProgressView
    
    var pageControl = UIPageControl()
    
    var selectIndex: Int = 0
    var selectIndexMax: Int = 4
    
    //**************************************************************************
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        testCustom = UICustomProgressView.init()
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //**************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        uid.initView(vView: view)
        view.addSubview(testCustom)
        testCustom.setProgress(vProgress: 0.45)
        //testCustom = UICustomProgressView.init(frame: CGRect(x: 200, y: 200, width: 500, height: 300))
        
        let titleAttributes = [NSAttributedStringKey.foregroundColor: AppColor.primary]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        // Add Page Control
        pageControl = uid.addPageControl(vStartPage: 0, vMaxPages: 5)
        
        uid.addAlignment(vView: pageControl, vAlignX: .center, vAlignY: .bottom, vWidth: 0, vHeight: 0, vSubX: nil, vSubY: nil)
        
        //uid.addAlignment(vView: testCustom, vAlignX: .center, vAlignY: .center, vWidth: 100, vHeight: 100, vSubX: nil, vSubY: nil)
        
        initButtonValues()
    }
    //**************************************************************************
    func initButtonValues()
    {
    }
    //**************************************************************************
    @objc func handleBackButton(button: UIButton) {
        AddDefenseVC().dismiss(animated: true, completion: nil)
        present(MainMenuViewController(), animated: true, completion: nil)
    }
    //**************************************************************************
    @objc func handleNextButton(button: UIButton) {
        selectIndex += 1
        if(selectIndex > selectIndexMax)
        {
            selectIndex = 0
        }
        pageControl.currentPage = selectIndex
    }
    //**************************************************************************
    @objc func handlePrevButton(button: UIButton) {
        selectIndex -= 1
        if(selectIndex < 0)
        {
            selectIndex = selectIndexMax
        }
        pageControl.currentPage = selectIndex
    }
    //**************************************************************************
}
