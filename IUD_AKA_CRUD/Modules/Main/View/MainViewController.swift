//
//  MainViewController.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Viper
    var presenter: MainPresenterInput? = nil
    
    // MARK: Outlets
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btnMode: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Data
    var data = MainViewModel()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        registerCells()
        requestData()
    }
    
    // MARK: Private
    private func configView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let refreshControl = UIRefreshControl()
        collectionView!.alwaysBounceVertical = true
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        
        collectionView!.refreshControl = refreshControl
    }
    
    @objc private func requestData() {
        presenter?.requestData()
    }
    
    private func registerCells() {
        let nib = UINib(nibName: KNibName.userDetail, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: KCellID.userDetail)
    }
    
    // MARK: Actions
    @IBAction func tapBtnMode(_ sender: Any) {
        let name = data.mode == .getInfo ? KSystemImageName.paperplane : KSystemImageName.trash
        
        btnMode.setImage(UIImage(systemName: name), for: .normal)
        
        data.mode = data.mode == .getInfo ? .remove : .getInfo
    }
}

// MARK: Viper View Protocol
protocol MainView {
    func loadData(_ data: [UserViewModel])
    func reloadView()
    func stopLoading()
    func stopRefresh()
    func showAlert(_ alert: UIAlertController)
}

extension MainViewController: MainView {
    
    func loadData(_ data: [UserViewModel]) {
        self.data.dataTable = data
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func stopRefresh() {
        DispatchQueue.main.async {
            guard let refreshControl = self.collectionView.refreshControl else { return }
            
            _ = refreshControl.isRefreshing ? refreshControl.endRefreshing() : nil
        }
    }
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Collection Data Source
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.dataTable.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCellID.userDetail, for: indexPath) as! UserDetailCollectionViewCell
        let item = data.dataTable[indexPath.row]
        
        cell.data = item
        cell.loadCell()
        
        return cell
    }
}

// MARK: Collection Data Source
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        
        switch data.mode {
        case .getInfo:
            presenter?.didSelectItem(data.dataTable[index])
        case .remove:
            presenter?.remove(index, from: &data.dataTable)
        }
    }
}

// MARK: Collection Flow Layout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 16
        let size = CGSize(width: width, height: 100)
        
        return size
    }
}

// MARK: Router
protocol MainRouter {
    
}

extension MainViewController: MainRouter {
    
}
