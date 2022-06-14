
import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

final class BeerListVC: BaseVC{
    
    private let beerListLabel = UILabel().then{
        $0.font = UIFont(name: "Helvetica-Bold", size: 32)
        $0.text = "BeerList"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let tableView = UITableView().then{
        $0.register(BeerCell.self, forCellReuseIdentifier: "cell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 200
        $0.separatorStyle = .none
    }
    private let viewModel = BeerListViewModel()
    
    override func setUp() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func configureVC() {
        view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData{ [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    override func addView() {
        view.addSubViews(beerListLabel,tableView)
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
}

extension BeerListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerCell
        cell.descriptionLabel.text = viewModel.dataSource[indexPath.row].description
        cell.beerImage.kf.setImage(with: URL(string: viewModel.dataSource[indexPath.row].imageUrl))
        
        cell.selectionStyle = .none
        return cell
    }
}
