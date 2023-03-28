import java.util.Scanner;

public class SommeDifferenceProduitQuotient {
        public static void main(String[] args) {
            try (Scanner scanner = new Scanner(System.in)) {
                // Ask the user to enter two numbers
                System.out.print("Enter the first number : ");
                int nombre1 = scanner.nextInt();

                System.out.print("Enter the second number : ");
                int nombre2 = scanner.nextInt();

                int somme = 0;
                int difference = 0;
                int produit = 0;
                int quotient = 0;

            somme = nombre1 + nombre2;

            if(nombre1 < nombre2) {
                difference = nombre2 - nombre1;
            }

            else {
                difference = nombre1 - nombre2;
            }

            produit = nombre1 * nombre2;

            quotient = nombre1 / nombre2;

            System.out.print("The sum is : " + somme + ", ");
            System.out.print("The difference is : " + difference + ", ");
            System.out.print("The product is : " + produit + ", ");
            System.out.print("The quotient is : " + quotient + ", ");
 
        }
    }
}    
