package ReFarmProject;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ReCountryData {
	public static List<ReCountry> getReCountryData() throws Exception {
		Document doc = Jsoup.connect("https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/list.do?townType=TOTY02&townTypeDet=").get();

		Elements titles = doc.select("li div.txt span.loc");
		Elements countrys = doc.select("li div.txt p.tit1");
		Elements images = doc.select("li div.img img");
		Elements states = doc.select("li div.state span.status");
		
		List<ReCountry> list = new ArrayList<ReCountry>();

		for (int i = 0; i < 12; i++) {
			Element title = titles.get(i);
			Element country = countrys.get(i);
			Element img = images.get(i);
			Element state = states.get(i);

			String t = title.text();
			String p = country.text();
			String im = img.absUrl("src");
			String s = state.text();

			ReCountry vo = new ReCountry(t, p, im, s);

			list.add(vo);
		}
		return list;
	}
}
