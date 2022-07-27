//
//  CollectionViewController.swift
//  JustPlay
//
//  Created by Imran razak on 27/07/2022.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate =  self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 2
      }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          return 
      }

}
