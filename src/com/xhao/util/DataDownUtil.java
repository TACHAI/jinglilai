package com.xhao.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DataDownUtil {

	/**
	 * ��ȡ��վԴ����Ϣ������
	 * @author hackxhao
	 * @version v1.0
	 * @param url ��������
	 * @param encoding ���뼯
	 * @return buffer 
	 */
	public static String getHtmlResourceByUrl(String url,String encoding){
		// �洢Դ��������
		StringBuffer buffer = new StringBuffer();
		URL urlObj = null;
		URLConnection uc = null;
		InputStreamReader isr = null;
		BufferedReader reader = null;
		
		try {
			// ������������
			urlObj = new URL(url);
			// ����������
			uc = urlObj.openConnection();
			// �����ļ�д����
			isr = new InputStreamReader(uc.getInputStream(),encoding);
			// ����������д����
			reader = new BufferedReader(isr);
			// ������ʱ�ļ�
			String temp = null;
			while((temp = reader.readLine()) !=null){
				buffer.append(temp+"\n"); // ׷�����ݣ�һ�߶�һ��д��
			}
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
			System.out.println("û������,�������");
		}catch (IOException e) {
			e.printStackTrace();
			System.out.println("����������ʧ�ܣ����Ժ�����");
		}finally{
			if(isr!=null){
				try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		return buffer.toString();
	}
	/***
	 * ����������վ��
	 * @author hackxhao
	 * @version v1.0
	 * @param url ��������
	 * @param encoding ���뼯
	 * @return maps
	 */
	public static List<HashMap<String,String>> getJobInfo(String url,String encoding){
		// 1.������վ��ҳ��ı��뼯��ȡ��ҳԴ����
		String html = getHtmlResourceByUrl(url, encoding);
		// 2.����Դ����
		Document document = Jsoup.parse(html);
		// ��ȡ����div id="newlist_list_content_table"
		Element element= document.getElementById("newlist_list_content_table");
		// ��ȡ���ʽ�������б� class="newlist"
		Elements elements= document.getElementsByClass("newlist");
		// ����һ��List����
		List<HashMap<String,String>> maps = new ArrayList<HashMap<String,String>>();
		
		for (Element el :elements) {
			HashMap<String,String> map = new HashMap<String,String>();
			// ��ȡ��˾����
			String textTitle = el.getElementsByClass("gsmc").text();
			// ��ȡְλ����
			String jobName = el.getElementsByClass("zwmc").text();
			// ��ȡ����
			String money = el.getElementsByClass("zwyx").text();
			// ��ȡ���ʵص�
			String address = el.getElementsByClass("gzdd").text();
			// ��ȡ����ʱ��
			String fadate = el.getElementsByClass("gxsj").text();
			map.put("textTitle",textTitle);
			map.put("jobName",jobName);
			map.put("money",money);
			map.put("address",address);
			map.put("fadate",fadate);
			maps.add(map);
		}
		
		return maps;
	}
	
	/**
	 * java ���
	 * @param args
	 */
	public static void main(String[] args) {
		String url = "http://www.jsolo.cn/";
		String encoding = "UTF-8";
		String html = getHtmlResourceByUrl(url, encoding);
		System.out.println(html);
	}

}
