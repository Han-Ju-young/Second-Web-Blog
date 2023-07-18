package ReFarmProject;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WorkData {
	public static List<Work> getWorkData() throws Exception {
		Document doc = Jsoup.connect("https://www.jobkorea.co.kr/recruit/joblist?menucode=industry&industryCtgr=10009&industry=1000063").get();

		Elements wheres = doc.select("tr.devloopArea td.tplCo a");
		Elements worknames = doc.select("tr.devloopArea td.tplTit div.titBx strong");
		Elements careers = doc.select("tr.devloopArea td.tplTit div.titBx p.dsc");
		Elements days = doc.select("tr.devloopArea td.odd span.time.dotum");
		Elements enddays = doc.select("tr.devloopArea td.odd span.date.dotum");
		
		List<Work> list = new ArrayList<Work>();

		for (int i = 0; i < 40; i++) {
			Element title = wheres.get(i);
			Element workname = worknames.get(i);
			Element career = careers.get(i);
			Element day = days.get(i);
			Element endday = enddays.get(i);

			String t = title.text();
			String w = workname.text();
			String c = career.text();
			String d = day.text();
			String ed = endday.text();

			Work vo = new Work(t, w, c, d, ed);

			list.add(vo);
		}
		return list;
	}
}
