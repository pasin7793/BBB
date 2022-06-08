
import Foundation
import UIKit
import Then
import SnapKit
import AlamofireImage
import Alamofire

final class BeerSearchVC: BaseVC, UISearchBarDelegate{
    private let searchBar = UISearchBar().then{
        $0.placeholder = "Search"
        $0.searchBarStyle = .minimal
    }
    private let beerImage = UIImageView()
    private let idLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "Helvetica", size: 12)
    }
    private let descriptionLabel = UITextView().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    let urlString = "https://api.punkapi.com/v2/beers/"
    
    var dataSource = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchBar.delegate = self
        searchBar.isSearchResultsButtonSelected = true
    }
    override func addView() {
        view.addSubview(searchBar)
        view.addSubview(beerImage)
        view.addSubview(idLabel)
        view.addSubview(descriptionLabel)
    }
    override func setLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.width.equalTo(358)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
        }
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
        }
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
    }
    func fetchData() {
        AF.request(urlString+(searchBar.searchTextField.text)!).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                //let res = response.result
                //print(res)
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([Beer].self, from: response.data ?? .init())
                    self.dataSource = json
                    print(json)
                    if let data = res as? Beer{
                        self.idLabel.text = "\(data.id)"
                    }
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
