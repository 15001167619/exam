package com.etycx.marry;

import com.etycx.marry.common.utils.ReadDoc;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:spring-context.xml"})
public class MarryTest {


    @Test
    public void testReadByDoc() throws Exception {
        File file = new File("D:\\test\\1.docx");
        String str = "";
        try {
            FileInputStream fis = new FileInputStream(file);
            XWPFDocument xdoc = new XWPFDocument(fis);
            XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
            String doc1 = extractor.getText();
            System.out.println(doc1);
            System.out.println(getLineNumberByIo(doc1));
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**   得到字符串中的行数  使用io*/
    public static long getLineNumberByIo(String target) throws IOException {

        LineNumberReader lnr = new LineNumberReader(new CharArrayReader(target.toCharArray()));
        lnr.skip(Long.MAX_VALUE);
        //System.out.println(lnr.getLineNumber() + 1);
        lnr.close();
        return lnr.getLineNumber() + 1;
    }


}
