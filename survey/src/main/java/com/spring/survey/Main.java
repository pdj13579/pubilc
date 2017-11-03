package com.spring.survey;
import java.util.Scanner;

public class Main {
	public static void main(String args[]){
		Scanner sc = new Scanner(System.in);
		int a,i;
		
		a = sc.nextInt();
		for(i = 0 ; i<a; i++){
			for(int j = 0 ;j<a;j++){
				if(j <i){
					System.out.println(" ");
				}else{
					System.out.println("*");
				}
				
			}
			
			
		}
		
	}

}

