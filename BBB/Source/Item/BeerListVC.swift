
import Foundation
import UIKit
import SnapKit
import Then

final class BeerListVC: BaseVC{
    
    private let beerListLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-Bold", size: 32)
        $0.text = "BeerList"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func addView() {
        view.addSubview(beerListLabel)
    }
    override func setLayout() {
        beerListLabel.snp.makeConstraints { make in
            make.top.equalTo(88)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(148)
        }
    }
}
