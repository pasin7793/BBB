
import Foundation
import UIKit
import Then
import SnapKit
import AlamofireImage
import Alamofire
import Kingfisher

final class RandomBeerVC: BaseVC{

    private let beerImageView = UIImageView()
    
    private let idLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "Helvetica", size: 12)
    }
    private let descriptionLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    
    private let resetButton = UIButton().then{
        $0.layer.cornerRadius = 20
        $0.layer.backgroundColor = UIColor(red: 0.488, green: 0.631, blue: 1, alpha: 1).cgColor
        $0.setTitle("Reset", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    private let viewModel = RandomBeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.beer.bind { [weak self] beer in
            guard let beer = beer else {return}
            DispatchQueue.main.async {
                self?.beerImageView.kf.setImage(with: URL(string: beer.imageUrl))
                self?.idLabel.text = "\(beer.id)"
                self?.descriptionLabel.text = beer.description
            }
        }
    }
    override func addView() {
        view.addSubViews(beerImageView,idLabel,descriptionLabel,resetButton)
    }
    override func setUp() {
        resetButton.addTarget(self, action: #selector(ResetButtonDidTap), for: .touchUpInside)
    }
    override func setLayout() {
        beerImageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.centerX.equalToSuperview()
            make.top.equalTo(200)
        }
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(beerImageView.snp.bottom).offset(5)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel).offset(71)
            make.width.equalTo(232)
            make.height.equalTo(81)
        }
        resetButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(150)
            make.width.equalTo(103)
            make.height.equalTo(37)
        }
    }
    @objc func ResetButtonDidTap(sender: UIButton!){
        viewModel.fetchData()
    }
}
