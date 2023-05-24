//
//  PaymentCollectionViewController .swift
//  PaymentApp
//
//  Created by Admin on 23.05.23.
//

import UIKit

final class PaymentCollectionViewController: UICollectionViewController {
    //MARK: - Private Properties
    private let layoutManager: CollectionViewLayoutManaging
    private let collectionViewCellControllerFactory: CollectionViewCellControllerFactory
    private var cellControllers: [AbstractCollectionViewCellController] = []
    
    //MARK: - Public Properties
    weak var delegate: PaymentCollectionViewControllerDelegate? = nil
    var task: (() -> Void)? = nil
    
    //MARK: - Initializers
    init(layoutManager: CollectionViewLayoutManaging) {
        self.layoutManager = layoutManager
        collectionViewCellControllerFactory = CollectionViewCellControllerFactory()
        super.init(collectionViewLayout: UICollectionViewLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError(coder.debugDescription)
    }
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - CollectionView DataSource Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellControllers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = cellControllers[section].sectionItems.count
        
        return numberOfItems
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellController = cellControllers[indexPath.section]
        let dequeuedCell = cellController.cellForItem(in: collectionView,
                                                      atIndexPath: indexPath)
        
        return dequeuedCell
        
    }
    //MARK: - CollectionView Delegate Methods
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let cellController = cellControllers[indexPath.section]
        cellController.didSelectCell(in: collectionView,
                                     atIndexPath: indexPath)
        
    }
    
    //MARK: - Private Methods
    private func configureCollectionView() {
        collectionView.collectionViewLayout = layoutManager.createLayout()
        collectionViewCellControllerFactory.registerCells(in: collectionView)
        cellControllers = collectionViewCellControllerFactory.cellControllers()
        cellControllers.forEach( { $0.cellEventHandler = self })
    }
}

//MARK: - Extension
extension PaymentCollectionViewController: CellEventHandler {
    
    func eventDidHappen(_ event: Event,
                        sender: CollectionViewCellControllerProtocol) {
        if let servicesCellEvent = event as? ServiceCellEvent,
           sender is ServicesCollectionViewCellController {
            delegate?.payService(servicesCellEvent.service, canProccedToPayment: true)
            
            if let paymentCardCellController = cellControllers.first(where: { $0 is PaymentCardCollectionViewCellController}) as? PaymentCardCollectionViewCellController {
                
                task = { [weak self] in
                    guard let currentWallet = paymentCardCellController.sectionItems.first as? Wallet else { return }
                    let difference = currentWallet.getTotalAmount() - servicesCellEvent.service.getServicePrice()
                    let newWallet = Wallet(totalAmount: difference, currency: .usd)
                    paymentCardCellController.update(wallet: newWallet)
                    
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                }
            }
        }
    }
}
