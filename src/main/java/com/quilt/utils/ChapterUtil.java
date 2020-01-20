package com.quilt.utils;

import com.quilt.dto.Chapter;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class ChapterUtil {

    public static List<Chapter> handleChapeter(String htmlContent){

        Document document = Jsoup.parse(htmlContent);
        Elements elements = document.getElementsByTag("h1");
        int i=1 ;
        List<Chapter> chapterList = new ArrayList<Chapter>();

        for (Element element : elements){

            String chapterName = element.text();
            String chapterId = element.attr("id");
            Chapter chapter = new Chapter(chapterId,i,chapterName);

            i++;
            chapterList.add(chapter);
        }

        return chapterList;
    }

}
