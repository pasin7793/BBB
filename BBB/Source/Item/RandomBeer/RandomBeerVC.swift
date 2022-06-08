
import Foundation
import UIKit
import Then
import SnapKit
import AlamofireImage
import Alamofire
import Kingfisher

final class RandomBeerVC: BaseVC{

    private let beerImage = UIImageView()
    
    private let idLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "Helvetica", size: 12)
    }
    private let descriptionTextView = UITextView().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    
    private let ResetButton = UIButton().then{
        $0.layer.cornerRadius = 20
        $0.layer.backgroundColor = UIColor(red: 0.488, green: 0.631, blue: 1, alpha: 1).cgColor
        $0.setTitle("Reset", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    let urlString = "https://api.punkapi.com/v2/beers/random"
    
    var dataSource: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func addView() {
        view.addSubview(beerImage)
        view.addSubview(idLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(ResetButton)
    }
    override func setUp() {
        ResetButton.addTarget(self, action: #selector(ResetButtonDidTap), for: .touchUpInside)
    }
    override func setLayout() {
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.centerX.equalToSuperview()
            make.top.equalTo(200)
        }
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(beerImage.snp.bottom).offset(5)
        }
        descriptionTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel).offset(71)
            make.width.equalTo(232)
            make.height.equalTo(81)
        }
        ResetButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionTextView.snp.bottom).offset(150)
            make.width.equalTo(103)
            make.height.equalTo(37)
        }
    }
    func fetchData() {
        AF.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                //let re = response.result
                //print(re)
                do {
                    let decoder = JSONDecoder()
                    guard let json = try decoder.decode([Beer].self, from: response.data ?? .init()).first else { return }
                    self.dataSource = json
                    print(json)
                     
                    self.beerImage.kf.setImage(with: URL(string: json.imageUrl),placeholder: UIImage())
                    self.idLabel.text = "\(self.dataSource?.id ?? 0)"
                    self.descriptionTextView.text = self.dataSource?.description
                    
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    @objc func ResetButtonDidTap(sender: UIButton!){
        fetchData()
    }
}
