//
//  ViewController.swift
//  4_la_rând
//
//  Created by Kayden on 23.06.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var CineAlegeImagine: UIImageView!
    
    var ScorRosu = 0
    var ScorAlbastru = 0
    override func viewDidLoad()
        {
            super.viewDidLoad()
            ReseteazăTabla()
            DimensiuneCelulă()
        }

        func DimensiuneCelulă()
        {
            let lățime = collectionView.frame.size.width / 9
            let înălțime = collectionView.frame.size.height / 6
            let dimensiune = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            dimensiune.itemSize = CGSize(width: lățime, height: înălțime)
        }

        func numberOfSections(in cv: UICollectionView) -> Int
        {
            return tablă.count
        }
        
        func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return tablă[section].count
        }

        func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
            let celulă = cv.dequeueReusableCell(withReuseIdentifier: "IDCelulă", for: indexPath) as! Celule
            
            let celulăTablă = ObțineCelulă(indexPath)
            celulă.imagine.tintColor = celulăTablă.culoareCelulă()
            return celulă
        }

    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            let coloană = indexPath.item
            if var celulăTablă = UltimulRândPosibil(coloană)
            {
                if let celulă = collectionView.cellForItem(at: celulăTablă.indexPath) as? Celule
                {
                    celulă.imagine.tintColor = ObțineCuloareCelulă()
                    celulăTablă.celulă = ObțineRândCurent()
                    UpdateCeluleTablă(celulăTablă)
                    
                    if Victorie()
                    {
                        if AlegeAlbastru()
                        {
                            ScorAlbastru += 1
                        }
                                        
                        if AlegeRosu()
                        {
                            ScorRosu += 1
                        }
                        Rezultat(MesajVictorie())
                    }
                    
                    if TablăPlină()
                    {
                        Rezultat("Egal !")
                    }
                    
                    ComutareJucător(CineAlegeImagine)
                }
            }
        }
    
    func Rezultat(_ title: String)
        {
            let message = "\nRosu: " + String(ScorRosu) + "\n\nAlbastru: " + String(ScorAlbastru)
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Din nou", style: .default, handler: {
                [self] (_) in
                ReseteazăTabla()
                self.reseteazăCelule()
            }))
            self.present(ac, animated: true)
        }
        
        func reseteazăCelule()
        {
            for celulă in collectionView.visibleCells as! [Celule]
            {
                celulă.imagine.tintColor = .lightGray
            }
        }

}

