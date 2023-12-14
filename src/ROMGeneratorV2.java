import java.io.*;

// Generate ROM file for ROM in vivado
// Used for parallel combinatorial multiplication
// Listing all the possible of num1 and num2 through a AND gate and write result into a txt file
public class ROMGeneratorV2 {
    //The number of bit
    private static final int BIT_NUMBER = 4;
    private static final int MAX_SHIFTING = 3;

    //The max number of shifting with two number will be (BIT_NUMBER - 1) * 2
    //The number of all possible result will be 2^((BIT_NUMBER - 1) * 2)
    private static final int TOTAL_COMB = (int) Math.pow(2,(BIT_NUMBER + MAX_SHIFTING)* 2);

    public static void main(String[] args) throws IOException {
        File file = new File("listv2.txt");
        OutputStream outputStream = new FileOutputStream(file);
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));

        try (outputStream; writer){
            for (int i = 0; i < TOTAL_COMB; i++) {
                String input = padZero(Integer.toBinaryString(i));
                int num1 = Integer.parseInt(input.substring(0, BIT_NUMBER), 2);
                int num2 = Integer.parseInt(input.substring(BIT_NUMBER, BIT_NUMBER * 2), 2);
                int num3 = num1 & num2;
                String address = Integer.toBinaryString(num3);
                int oneBitNUmber = oneBitCounter(address);
                int shifter1 = Integer.parseInt(input.substring(BIT_NUMBER * 2, BIT_NUMBER * 2 + 3), 2);
                int shifter2 = Integer.parseInt(input.substring(BIT_NUMBER * 2 + 3, BIT_NUMBER * 2 + 6), 2);
                writer.write(Integer.toBinaryString(oneBitNUmber << (shifter1 + shifter2)));
                writer.newLine();
            }
        } catch (IOException ignore) {
        }
    }

    //Counting how many of 1bit it have after a AND gate
    private static int oneBitCounter(String binaryNumber) {
        int number = 0;

        for (int i = 0; i < binaryNumber.length(); i++) {
            if (binaryNumber.charAt(i) == '1') {
                number++;
            }
        }

        return number;
    }

    private static String padZero(String binaryString) {
        int stringLength = binaryString.length();
        int zeroNUmber = (BIT_NUMBER + MAX_SHIFTING) * 2 - stringLength;

        return "0".repeat(Math.max(0, zeroNUmber)) + binaryString;
    }
}