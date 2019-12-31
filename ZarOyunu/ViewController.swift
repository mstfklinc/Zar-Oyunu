//
//  ViewController.swift
//  ZarOyunu
//
//  Created by apple on 7.12.2019.
//  Copyright © 2019 Mustafa KILINÇ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblOyuncu1Skor: UILabel!
    @IBOutlet weak var lblOyuncu2Skor: UILabel!
    @IBOutlet weak var lblOyuncu1Puan: UILabel!
    @IBOutlet weak var lblOyuncu2Puan: UILabel!
    @IBOutlet weak var imgOyuncy1Durum: UIImageView!
    @IBOutlet weak var imgOyuncu2Durum: UIImageView!
    @IBOutlet weak var imgZar1: UIImageView!
    @IBOutlet weak var imgZar2: UIImageView!
    @IBOutlet weak var lblSetSonucu: UILabel!
    
    var oyuncuPuanlari = (birinciOyuncuPuani : 0, ikinciOyuncuPuani : 0)
    var oyuncuSkorlari = (birinciOyuncuSkoru : 0 , ikinciOyuncuSkoru : 0)
    var oyuncuSira : Int = 1
    var maxSetSayisi : Int = 5
    var suankiSet : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //closure
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5)
        {
            
        }
        
        if let arkaPlan = UIImage(named: "arkaPlan")
        {
            self.view.backgroundColor = UIColor(patternImage: arkaPlan)
        }
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       
        if suankiSet > maxSetSayisi
        {
            return
        }
        
        zarDegerleriniUret()
        
    }
    
    func setSonucu(zar1: Int, zar2: Int)
    {
       if oyuncuSira == 1
              {
                  oyuncuPuanlari.birinciOyuncuPuani = zar1 + zar2
                  lblOyuncu1Puan.text = String(oyuncuPuanlari.birinciOyuncuPuani)
                  imgOyuncy1Durum.image = UIImage(named: "bekle")
                  imgOyuncu2Durum.image = UIImage(named: "onay")
                  lblSetSonucu.text = "Sıra 2. oyuncuda"
                  oyuncuSira = 2
                  lblOyuncu2Puan.text = "0"
              }
              else
              {
                  oyuncuPuanlari.ikinciOyuncuPuani = zar1 + zar2
                  lblOyuncu2Puan.text = String(oyuncuPuanlari.ikinciOyuncuPuani)
                  imgOyuncy1Durum.image = UIImage(named: "onay")
                  imgOyuncu2Durum.image = UIImage(named: "bekle")
                  lblSetSonucu.text = "Sıra 1. oyuncuda"
                  oyuncuSira = 1
                
                 
                  
                  if oyuncuPuanlari.birinciOyuncuPuani > oyuncuPuanlari.ikinciOyuncuPuani
                  {
                      //1. oyuncu oyunu kazandı
                      oyuncuSkorlari.birinciOyuncuSkoru += 1
                      lblSetSonucu.text = "\(suankiSet). seti 1. oyuncu kazandı!"
                      suankiSet += 1
                      lblOyuncu1Skor.text = String(oyuncuSkorlari.birinciOyuncuSkoru)
                  }
                  else if oyuncuPuanlari.ikinciOyuncuPuani > oyuncuPuanlari.birinciOyuncuPuani
                  {
                      //2. oyuncu oyunu kazandı
                      oyuncuSkorlari.ikinciOyuncuSkoru += 1
                      lblSetSonucu.text = "\(suankiSet). seti 2. oyuncu kazandı!"
                      suankiSet += 1
                      lblOyuncu2Skor.text = String(oyuncuSkorlari.ikinciOyuncuSkoru)
                  }
                  else
                  {
                      // oyunun berabere kalması durumunda
                      //bu durumda set sayısı değiştirilmeyecek
                      lblSetSonucu.text = "\(suankiSet). set berabere sonuçlanmıştır."
                  }
                  
              }
    }
    
    func zarDegerleriniUret()
    {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3)
        {
            let zar1 = arc4random_uniform(6) + 1
            let zar2 = arc4random_uniform(6) + 1
            
            self.imgZar1.image = UIImage(named: String(zar1))
            self.imgZar2.image = UIImage(named: String(zar2))
            self.setSonucu(zar1: Int(zar1), zar2: Int(zar2))
            
            if self.suankiSet > self.maxSetSayisi
            {
                if self.oyuncuSkorlari.birinciOyuncuSkoru > self.oyuncuSkorlari.ikinciOyuncuSkoru
                {
                    self.lblSetSonucu.text = "Oyunun galibi 1. Oyuncu!"
                }
                else
                {
                    self.lblSetSonucu.text = "Oyunun galibi 2. Oyuncu!"
                }
            }
        }
        
        lblSetSonucu.text = "\(oyuncuSira). oyuncu zar atıyor!!"
        imgZar1.image = UIImage(named: "bilinmeyenZar")
        imgZar2.image = UIImage(named: "bilinmeyenZar")
        
        
    }

    
    

}

