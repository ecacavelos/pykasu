package py.com.roshka.pykasu.web.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class BranchOfficeManager {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(BranchOfficeManager.class);

	private static List <Zone> zones = null;
	
	
	public static List <Zone> getBranchOfficeByZone(){
//		if(zones == null){
			zones = new ArrayList<Zone>();
			InputStream is;
			try {
				//new FileInputStream()
				String url = System.getProperty("jboss.server.config.url")+"/sucursales.xml";
				URL sucursales = new URL(url);
				logger.info(String.format("Abriendo: %s", url));				
				is = sucursales.openStream();
				
				//is = new FileInputStream(fn);
	            DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	            org.w3c.dom.Document doc = db.parse(is);
	            
	    		NodeList nl = doc.getElementsByTagName("region");

	            for(int i=0; i<nl.getLength(); i++){
	            	Node node = nl.item(i);
	            	zones.add(fromNode(node));
	            }
	            return zones;
	            
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
				return zones;
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
				return zones;
			} catch (SAXException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
				return zones;
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e.getMessage(), e);
				return zones;
			}			
//		}		
//		return zones;
	}
	
	
	public static Zone fromNode(Node node) {
		Zone zone  = new Zone();
		
		NamedNodeMap attrs = node.getAttributes();
		
		
		zone.setName(attrs.getNamedItem("nombre").getNodeValue());
		zone.setOrder(Integer.parseInt(attrs.getNamedItem("orden").getNodeValue()));
		 
		NodeList nl = node.getChildNodes();
		
		for(int i=0; i<nl.getLength(); i++){
			BranchOffice bo = new BranchOffice();
			
			NamedNodeMap boAttrs = nl.item(i).getAttributes();

			if(nl.item(i).getNodeType() == Node.ELEMENT_NODE){
				
				logger.info("---> " + nl.item(i).getNodeName());
				
				for(int j=0;j<boAttrs.getLength();j++){
					logger.info("---> " + boAttrs.item(j).getNodeName() +" :: "+ boAttrs.item(j).getNodeValue());
				}
				bo.setId(Integer.parseInt(boAttrs.getNamedItem("id").getNodeValue()));
				bo.setName(boAttrs.getNamedItem("nombre").getNodeValue());			
				bo.setAddress(boAttrs.getNamedItem("direccion").getNodeValue());
				bo.setOrder(Integer.parseInt(boAttrs.getNamedItem("orden").getNodeValue()));
	
				zone.getBranchOffices().add(bo);
			}
		}
		
		return zone;
	}
	public static class BranchOffice implements Comparable<BranchOffice>{
		private String name;
		private int order;
		private int id;
		private String address;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getOrder() {
			return order;
		}
		public void setOrder(int order) {
			this.order = order;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public int compareTo(BranchOffice o) {
			return this.order - o.order;
		}
		
	}
	
	
	public static class Zone implements Comparable<Zone>{
		private String name;
		private int order;
		private List<BranchOffice> branchOffices = new ArrayList<BranchOffice>();
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getOrder() {
			return order;
		}
		public void setOrder(int order) {
			this.order = order;
		}
		public List<BranchOffice> getBranchOffices() {
			return branchOffices;
		}
		public void setBranchOffices(List<BranchOffice> branchOffices) {
			this.branchOffices = branchOffices;
		}
		public int compareTo(Zone o) {
			return this.order - o.order;
		}
	}
	
}
