//
//  ViewController.swift
//  pager
//
//  Created by AMIT on 7/24/18.
//  Copyright © 2018 com.hgdhghdgfd. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        currentIndex -= 1
        
        if currentIndex >= 0  {
            
            return self.getVC(index: currentIndex)
            
            
        }
      
        currentIndex += 1
       
        return nil
    }
    
    func getVC(index:Int)->UIViewController {
        
        return  (self.storyboard?.instantiateViewController(withIdentifier: arr[index]))!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        currentIndex += 1
        
        if currentIndex < arr.count {
           
            return self.getVC(index: currentIndex)
            
            
        }
        
        
        currentIndex -= 1
        
        return nil
    }
    
    var currentIndex = 0
    
    let arr = ["f","s","t"]

    @IBAction func btnClicked(_ sender: Any) {
        
        
        currentIndex = 1
        
        pag.setViewControllers([self.getVC(index:currentIndex)], direction:.forward, animated: true, completion: nil)
        
    }
    
    let pag = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: [:])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        pag.delegate = self
        
        pag.dataSource = self
        
        pag.view.frame = view.frame.offsetBy(dx: 0, dy: 100)
        
        self.view.addSubview(pag.view)
        
        self.addChildViewController(pag)
        
        pag.willMove(toParentViewController: self)
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "f")
       
        pag.setViewControllers([vc1!], direction: .forward, animated: true) { (v) in
            print("hdhbncxbnxc")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    
    
}

