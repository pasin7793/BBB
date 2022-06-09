
import Foundation
import UIKit
import SnapKit
import Then
import Alamofire
import AlamofireImage

final class BeerListVC: BaseVC,UITableViewDataSource, UITableViewDelegate{
    
    private let beerListLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-Bold", size: 32)
        $0.text = "BeerList"
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private let tableView = UITableView().then{
        $0.register(BeerCell.self, forCellReuseIdentifier: "cell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 200
        $0.separatorStyle = .none
    }
    var dataSource = [Beer]()
    
    let urlString = "https://api.punkapi.com/v2/beers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func addView() {
        view.addSubview(beerListLabel)
        view.addSubview(tableView)
    }
    override func setLayout() {
        beerListLabel.snp.makeConstraints { make in
            make.top.equalTo(88)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(148)
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func fetchData() {
        AF.request(urlString).responseJSON { (response) in
            switch response.result {
            case .success:
                let res = response.result
                //print(res)
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([Beer].self, from: response.data ?? .init())
                    self.dataSource = json
                    //print(json)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerCell
        
        cell.descriptionTextView.text = dataSource[indexPath.row].description
        
        let beer: Beer
        beer = dataSource[indexPath.row]
        cell.beerImage.kf.setImage(with: URL(string: beer.imageUrl) ?? .none, placeholder: UIImage())
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailBeerListVC()
        let navigationController = UINavigationController(rootViewController: detailVC)
        self.navigationController?.pushViewController(navigationController, animated: true)
        print("asd")
    }
}
