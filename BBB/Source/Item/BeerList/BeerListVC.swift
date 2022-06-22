
import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

final class BeerListVC: BaseVC{
    
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "BeerList"
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
        view.addSubViews(tableView)
    }
    override func setLayout() {
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
        cell.bind(model: viewModel.dataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
