//
//  FoodDetailsViewController.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 5.01.2022.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    
    var food:Food?
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodMaterialsLAbel: UILabel!
    
    @IBOutlet weak var nutritionView: UIView!
    @IBOutlet weak var nutrition2View: UIView!
    @IBOutlet weak var nutrition3View: UIView!
    
    @IBOutlet weak var caloriesView: UIView!
    @IBOutlet weak var carbonView: UIView!
    @IBOutlet weak var proteinView: UIView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var carbonLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var likeButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let food = food {
            if food.food_isLiked == "true"{
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }else{
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            foodNameLabel.text = food.food_name
        }
        
        configureUI()
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if let food = food {
            if food.food_isLiked == "false"{
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                food.food_isLiked = "true"
            }else{
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                food.food_isLiked = "false"
            }
        }
    }
    
    func configureUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        UIView().viewConfigure(view: nutritionView)
        UIView().viewConfigure(view: nutrition2View)
        UIView().viewConfigure(view: nutrition3View)
        
        let radius = caloriesView.frame.size.height
        caloriesView.layer.cornerRadius = radius / 2
        carbonView.layer.cornerRadius = radius / 2
        proteinView.layer.cornerRadius = radius / 2
        
    }
}

extension FoodDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if let recipe = food?.recipe{
            if let count = recipe.recipe_contents?.count{
                return count
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (food?.recipe?.recipe_contents![section].count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodDetailsCell", for: indexPath) as! FoodDetailCell
        let recipe = food?.recipe?.recipe_contents![indexPath.section][indexPath.row]
        cell.detailsLabel.text = recipe
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
                header.textLabel!.font = UIFont.boldSystemFont(ofSize: 17)
                header.textLabel!.textColor = UIColor.black
                header.textLabel!.frame = CGRect(x: 16, y: 0, width: 200, height: 30)
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Ingredients"
        }else{
            return "Receipe Preparation"
        }
    }
}
