
import Foundation
import UIKit
import Then
import SnapKit
import Alamofire
import Kingfisher

final class BeerSearchVC: BaseVC, UISearchBarDelegate{
    
    private let searchBar = UISearchBar().then{
        $0.placeholder = "Search"
        $0.searchBarStyle = .minimal
    }
    private let beerImageView = UIImageView()
    
    private let idLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "Helvetica", size: 12)
    }
    private let descriptionTextView = UITextView().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    let urlString = "https://api.punkapi.com/v2/beers/"
    
    var dataSource: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func addView() {
        view.addSubViews(searchBar,beerImageView,idLabel,descriptionTextView)
    }
    override func setUp() {
        view.backgroundColor = .white
        searchBar.delegate = self
        searchBar.isSearchResultsButtonSelected = true
    }
    override func setLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.width.equalTo(358)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
        }
        beerImageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.centerX.equalToSuperview()
            make.top.equalTo(searchBar).offset(60)
        }
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchBar).offset(200)
        }
        descriptionTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel).offset(71)
            make.width.equalTo(232)
            make.height.equalTo(81)
        }
    }
    func fetchData() {
        AF.request(urlString+(searchBar.searchTextField.text)!).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                //let re = response.result
                //print(re)
                do {
                    let decoder = JSONDecoder()
                    guard let json = try decoder.decode([Beer].self, from: response.data ?? .init()).first else { return }
                    self.dataSource = json
                    print(json)
                     
                    self.beerImageView.kf.setImage(with: URL(string: json.imageUrl),placeholder: UIImage())
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
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        fetchData()
    }
}
