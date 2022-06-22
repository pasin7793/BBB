
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
    private let descriptionLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-bold", size: 16)
        $0.textAlignment = .center
    }
    
    private let viewModel = BeerSearchViewModel()

    override func addView() {
        view.addSubViews(searchBar,beerImageView,idLabel,descriptionLabel)
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
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel).offset(71)
            make.width.equalTo(232)
            make.height.equalTo(81)
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        viewModel.beer.bind { [weak self] beer in
            guard let beer = beer else {return}
            DispatchQueue.main.async {
                self?.beerImageView.kf.setImage(with: URL(string: beer.imageUrl))
                self?.idLabel.text = "\(beer.id)"
                self?.descriptionLabel.text = beer.description
            }
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        print(searchBar.text)
        viewModel.fetchData(searchText: searchBar.text ?? "")
    }
}
