import java.util.Arrays;
import java.util.HexFormat;
import java.util.Scanner;

public class conversion {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a number: ");
        String number = scanner.nextLine();
        for (int i = number.length() - 1; i >= 0; i = i - 2) {
            String split = number.substring(i - 1, i +1 );
            System.out.println(padZero(Arrays.toString(HexFormat.of().parseHex(split))));
        }
        System.out.println("Enter a number: ");
        for (int i = number.length() - 1; i >= 0; i = i - 2) {
            String split = number.substring(i - 1, i +1 );
            System.out.println(padZero(Arrays.toString(HexFormat.of().parseHex(split))));
        }
    }

    private static String padZero(String binaryString) {
        int stringLength = binaryString.length();
        int zeroNUmber = 8 - stringLength;

        return "0".repeat(Math.max(0, zeroNUmber)) + binaryString.charAt(1);
    }
}
