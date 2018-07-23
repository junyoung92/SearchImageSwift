//
//  ViewController.swift
//  SearchImageSwift
//
//  Created by Kiljunyoung on 2018. 7. 20..
//  Copyright © 2018년 jy. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var label: UILabel!
    
    var data:[ImageResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.isHidden = false
        self.collectionView.isHidden = true
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        self.label.text = "검색하고 싶은 이미지를 입력해 주세요 :)"
    }
    
    @IBAction func searchAction(_ sender: Any) {
        self.mainView.isHidden = false
        self.collectionView.isHidden = true
        
        if searchField.text != "" {
            let headers = ["Content-Type" : "application/json","Accept" : "application/json", "X-Naver-Client-Id": Const.clientId, "X-Naver-Client-Secret": Const.clientSecret]
            
            Alamofire.request(Const.SEARCH(searchField.text!), method: .get, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseObject{ (response: DataResponse<Image>) in
                switch response.result {
                case .success(let value):
                    self.data = (response.result.value?.items)!
                    
                    if self.data.count > 0 {
                        
                        self.mainView.isHidden = true
                        self.collectionView.isHidden = false
                        self.collectionView.reloadData()
                    } else {
                        self.label.text = "검색 결과가 없습니다."
                    }
                case .failure(let error):
                    self.label.text = "검색에 실패했습니다."
                }
            }
        } else {
            self.label.text = "검색어를 입력해주세요."
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = data[indexPath.row]
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.configureCell(row)
            return cell
        }
        return ImageCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width/3-10, height: UIScreen.main.bounds.size.width/3-10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

