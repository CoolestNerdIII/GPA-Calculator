import java.util.Scanner;

public class Calculator {

	public static void main(String[] args) {
      Scanner key = new Scanner(System.in);
      double gpa = 0;
      int counter = 0;
      while(key.hasNextDouble()){
    	  gpa += key.nextDouble();
    	  counter++;
      }
      System.out.println("Your GPA of " + counter + " classes is: " + gpa / counter);
      key.close();
	}
}
