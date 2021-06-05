module UsersHelper
    
    def gender_display(user)
        if user.gender == "m"
            return "男性"
        elsif  user.gender == "f"
            return "女性"
        else 
            return "その他"
        end
    end
    
    
    
    
end
