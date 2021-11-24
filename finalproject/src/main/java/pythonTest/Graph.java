package pythonTest;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Graph {
	public void rating(String email) {
		try {
			String line;
			Process p = Runtime.getRuntime()
					.exec("python C:\\spring\\springSrc\\finalproject\\src\\main\\java\\pythonTest\\test4.py "+email);
			BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while ((line = input.readLine()) != null) {
				System.out.println(line);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
	}

	public void wordcloud(String email) {
		try {
			String line;
			Process p = Runtime.getRuntime()
					.exec("python C:\\spring\\springSrc\\finalproject\\src\\main\\java\\pythonTest\\test5.py "+email);
			BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while ((line = input.readLine()) != null) {
				System.out.println(line);
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
	}
}	