package util;

public class HashGeneratorTest {
	public static void main(String[] args) {
		try {
			System.out.println(HashGeneratorUtils.generateSHA256("admin12345"));
			System.out.println(HashGeneratorUtils.generateSHA256("123456789"));
		} catch (HashGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
