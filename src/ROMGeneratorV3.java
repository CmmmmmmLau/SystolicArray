import java.io.*;

public class ROMGeneratorV3 {
    private static final int BIT_NUMBER = 8;

    private static final int TOTAL_COMB = (int) Math.pow(2,BIT_NUMBER);

    public static void main(String[] args) throws IOException {
        File file = new File("listv3.txt");
        OutputStream outputStream = new FileOutputStream(file);
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));

        try (outputStream; writer){
            for (int i = 0; i < TOTAL_COMB; i++) {
                String address = padZero(Integer.toBinaryString(i));
                int comp1 = Integer.parseInt(address.substring(0, BIT_NUMBER / 2), 2);
                int comp2 = Integer.parseInt(address.substring(BIT_NUMBER / 2, BIT_NUMBER), 2);
                int result = oneBitCounter(Integer.toBinaryString(comp1 & comp2));
                writer.write(Integer.toBinaryString(result));
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
        int zeroNUmber = BIT_NUMBER - stringLength;

        return "0".repeat(Math.max(0, zeroNUmber)) + binaryString;
    }
}