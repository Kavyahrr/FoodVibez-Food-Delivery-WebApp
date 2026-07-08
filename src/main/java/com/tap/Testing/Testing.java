package com.tap.Testing;

import java.util.List;
import java.util.Scanner;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

public class Testing {

	public static void main(String[] args) {
		//		Connection connection = DBConnection.getConnection();
		//		System.out.println("Connection is Created ");


		Scanner scan = new Scanner(System.in);


				//ADD USER
				System.out.println("Enter User Name : ");
				String name = scan.next();
				System.out.println("Enter User Email : ");
				String email = scan.next();
				System.out.println("Enter User Password : ");
				String password = scan.next();
				System.out.println("Enter User Address : ");
				String address = scan.next();
				System.out.println("Enter User Role : ");
				String role = scan.next();
	
				User u = new User(name,email,password,address,role);
				UserDAOImpl udao = new UserDAOImpl();
				udao.addUser(u);
				System.out.println("User Added");


		//GET USER 
		//		UserDAOImpl udao = new UserDAOImpl();
		//		 User u = udao.getUser(1);
		//		 System.out.println(u);


		//		//GET ALL USER
		//		
		//		UserDAOImpl udao = new UserDAOImpl();
		//		List<User> allUser = udao.getAllUser();
		//		
		//		for(User user : allUser) {
		//			System.out.println(user);
		//		}


//		//UPDATE  USER
//		User u = null;
//
//		UserDAOImpl udao = new UserDAOImpl();
//		System.out.println("Enter the User id ");
//		int id = scan.nextInt();
//		if( id == 1) {
//			u = udao.getUser(id);
//			System.out.println(u);
//			updateDetails(scan, u, udao);
//
//		}
//		else if( id == 2) {
//			u = udao.getUser(id);
//			System.out.println(u);
//			updateDetails(scan, u, udao);
//		}
//
//	}
//
//	private static void updateDetails(Scanner scan, User u, UserDAOImpl udao) {
//		System.out.println("What do you wnat to upadte : 1 : name 2 : email 3 : password 4 : Address 5 : Role");
//		int choice = scan.nextInt();
//
//		System.out.println("Enter ");
//
//		if (choice == 1 ) {
//			String name = scan.next();
//			u.setName(name);
//			udao.updateUser(u);
//			System.out.println(u);
//		}
//		else if (choice == 2 ) {
//			String email = scan.next();
//			u.setEmail(email);
//			udao.updateUser(u);
//			System.out.println(u);
//		}
//		else if (choice == 3 ) {
//			String password = scan.next();
//			u.setPassword(password);
//			udao.updateUser(u);
//			System.out.println(u);
//		}
//		else if (choice == 4 ) {
//			String address = scan.next();
//			u.setAddress(address);
//			udao.updateUser(u);
//			System.out.println(u);
//		} 
//		else if (choice == 5 ) {
//			String role = scan.next();
//			u.setRole(role);
//			udao.updateUser(u);
//			System.out.println(u);
//		}
//	}

		
		//Delete User 
//		UserDAOImpl udao = new UserDAOImpl();
//		System.out.println("Enter the User id ");
//		int id  = scan.nextInt();
//		udao.deleteUpadte(id);
//		System.out.println("User Deleted Successfully");
		
	}	
		
}

