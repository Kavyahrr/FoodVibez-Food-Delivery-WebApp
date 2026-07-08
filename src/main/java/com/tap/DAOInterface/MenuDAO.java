package com.tap.DAOInterface;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {

    void addMenu(Menu m);

    void updateMenu(Menu m);

    void deleteMenu(int id);

    Menu getMenu(int id);

    List<Menu> getAllMenu();
    
    List<Menu> getMenuByRestaurantId(int restaurantId);
}