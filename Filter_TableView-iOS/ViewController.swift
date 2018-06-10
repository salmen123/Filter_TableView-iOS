//
//  ViewController.swift
//  Filter_TableView-iOS
//
//  Created by Med Salmen Saadi on 6/9/18.
//  Copyright © 2018 Med Salmen Saadi. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tv_List: UITableView!
    @IBOutlet weak var sb_SearchFood: UISearchBar!
    
    var Foods = Array<Food>()
    var CurrentFoods = Array<Food>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LoadFoods()
        sb_SearchFood.delegate = self
        sb_SearchFood.placeholder = "Search Food"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LoadFoods() {
        Foods.append(Food(Name: "kiwi", Calories: 46, Image: "kiwi", Type: .Fruit))
        Foods.append(Food(Name: "beetroot", Calories: 28, Image: "beetroot", Type: .Vegetable))
        Foods.append(Food(Name: "avocado", Calories: 306, Image: "avocado", Type: .Fruit))
        Foods.append(Food(Name: "cabbage", Calories: 18, Image: "cabbage", Type: .Vegetable))
        Foods.append(Food(Name: "blackberries", Calories: 37, Image: "blackberries", Type: .Fruit))
        Foods.append(Food(Name: "capsicum", Calories: 15, Image: "capsicum", Type: .Vegetable))
        Foods.append(Food(Name: "cherries", Calories: 52, Image: "cherries", Type: .Fruit))
        Foods.append(Food(Name: "carrots", Calories: 30, Image: "carrots", Type: .Vegetable))
        Foods.append(Food(Name: "apple", Calories: 83, Image: "apple", Type: .Fruit))
        Foods.append(Food(Name: "celery", Calories: 7, Image: "celery", Type: .Vegetable))
        Foods.append(Food(Name: "mango", Calories: 135, Image: "mango", Type: .Fruit))
        Foods.append(Food(Name: "mushroom", Calories: 13, Image: "mushroom", Type: .Vegetable))
        Foods.append(Food(Name: "peach", Calories: 37, Image: "peach", Type: .Fruit))
        Foods.append(Food(Name: "onions", Calories: 64, Image: "onions", Type: .Vegetable))
        Foods.append(Food(Name: "plum", Calories: 37, Image: "plum", Type: .Fruit))
        Foods.append(Food(Name: "potato", Calories: 75, Image: "potato", Type: .Vegetable))
        
        CurrentFoods = Foods
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TVCell
        
            cell.la_Name.text=CurrentFoods[indexPath.row].Name!
        cell.la_Calories.text = ("Calories: \(CurrentFoods[indexPath.row].Calories!)")
            cell.iv_Image.image = UIImage(named: CurrentFoods[indexPath.row].Image!)
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        CurrentFoods = Foods.filter({ (food) -> Bool in
            switch sb_SearchFood.selectedScopeButtonIndex
            {
            case 0:
                if searchText.isEmpty {return true}
                return (food.Name?.lowercased().contains(searchText.lowercased()))!
            case 1:
                if searchText.isEmpty {return food.TypeF == FoodType.Fruit}
                return (food.Name?.lowercased().contains(searchText.lowercased()))! && food.TypeF == FoodType.Fruit
            case 2:
                if searchText.isEmpty {return food.TypeF == FoodType.Vegetable}
                return (food.Name?.lowercased().contains(searchText.lowercased()))! && food.TypeF == FoodType.Vegetable
            default:
                return false
            }
        })
        tv_List.reloadData()
        /*guard !searchText.isEmpty else {
            CurrentFoods = Foods
            tv_List.reloadData()
            return
        }
        CurrentFoods = Foods.filter({ (food) -> Bool in
            food.Name!.lowercased().contains(searchText.lowercased())
        })
        tv_List.reloadData()*/
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            CurrentFoods = Foods
        case 1:
            CurrentFoods = Foods.filter({ (food) -> Bool in
                food.TypeF == FoodType.Fruit
            })
        case 2:
            CurrentFoods = Foods.filter({ (food) -> Bool in
                food.TypeF == FoodType.Vegetable
            })
        default:
            break
        }
        tv_List.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
        UIView.animate(withDuration: 0.5,
                       animations: {cell.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)},
                       completion: nil)
    }

}

