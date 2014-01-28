package py.com.roshka.pykasu.xml;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.Validator;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.form.Line;
import py.com.roshka.pykasu.ui.form.Section;
import py.com.roshka.pykasu.ui.form.SimpleForm;
import py.com.roshka.pykasu.ui.form.Trigger;
import py.com.roshka.pykasu.ui.menu.Action;
import py.com.roshka.pykasu.ui.menu.Program;

import py.com.roshka.pykasu.exceptions.PykasuParsingException;
import py.com.roshka.pykasu.persistence.users.Role;

//---------------------
//import com.sun.org.apache.xerces.internal.jaxp.validation.xs.SchemaFactoryImpl;

public class Parser {
	
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Parser.class);
	
	public static final String XML_FORM      = "form";
	public static final String XML_SECTIONS  = "sections";
	public static final String XML_ATTR_TYPE = "type";
	public static final String XML_ATTR_DESCRIPTION = "description";	
	public static final String XML_RULES     = "rules";	
	
	public static final String FORM_TYPE_HEADER = "header";
	public static final String FORM_TYPE_BODY   = "body";
	public static final String FORM_TYPE_FOOTER = "footer";	
	public static final String  XML_FORM_RULES  = "rules";
	public static final String  XML_FORM_RULE   = "rule";	

	public static final String XML_MENU      = "menu";
	public static final String XML_PROGRAM   = "program";
	public static final String XML_ACTION	 = "action";
	
	
	//-- Upload File Form
	public static final String XML_DECLARATION      = "declaracion";
	public static final String XML_ATTR_FORM 		= "formulario";
	public static final String XML_ATTR_VERSION		= "version";
	public static final String XML_ATTR_DATE 		= "fechaDocumento";
	
	public static final String XML_RUC      		= "ruc";
	public static final String XML_DV 				= "dv";
	public static final String XML_DETAILS			= "detalle";
	
	
	public static Form parseForm(InputStream is){
        try{
            DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            org.w3c.dom.Document doc = db.parse(is);
            
            return parseForm(doc);
        }catch (Throwable e){
            System.out.println(System.getProperty("java.vm.version"));
            System.out.println(System.getProperty("java.specification.version"));
            e.printStackTrace();
        }

		return null;
	}
	

	private static Form parseForm(org.w3c.dom.Document doc){
		Form form = new Form();
        Element e = doc.getDocumentElement();
        if (e != null && e.getNodeName().equals(XML_FORM)){
        	form.setDescription(e.getAttribute(XML_ATTR_DESCRIPTION));
        	form.setName(e.getAttribute(XML_ATTR_DESCRIPTION));
        	form.setType(e.getAttribute(XML_ATTR_TYPE));
        	form.setId(e.getAttribute(XML_ATTR_TYPE));
        	
            NodeList xmlSections = e.getElementsByTagName(XML_SECTIONS);
            loadForm(form, xmlSections);

            NodeList xmlTrigges = e.getElementsByTagName(XML_FORM_RULE);
            loadFormTriggers(form, xmlTrigges);
        } 
        
        return form;
	}
	

	private static void loadForm(Form form, NodeList xmlSections){
		for(int i=0; i< xmlSections.getLength(); i++){ //iterate sections     	
			String type = xmlSections.item(i).getAttributes().getNamedItem(XML_ATTR_TYPE).getNodeValue();
			NodeList nl = xmlSections.item(i).getChildNodes();
			
			if(type.equals(FORM_TYPE_HEADER)){
			   	loadSection(form.getHeaders(), nl, form);
			}else if(type.equals(FORM_TYPE_BODY)){
			   	loadSection(form.getSections(), nl, form);
			}else if(type.equals(FORM_TYPE_FOOTER)){
			   	loadSection(form.getFooters(), nl, form);				
			}
	    }
	}
	
	@SuppressWarnings("unchecked")
	private static void loadSection(Map sectionMap, NodeList xmlSection, Form form){
		Section section = null;
		for(int i=0; i< xmlSection.getLength(); i++){ //iterate sections
			if(xmlSection.item(i).getNodeType() == Node.ELEMENT_NODE){
				section = new Section(form);
				fillSection(section, xmlSection.item(i).getAttributes());
				NodeList nl = xmlSection.item(i).getChildNodes();
				loadLine(section, nl);
				
				sectionMap.put(section.getId(),section);
			}
	    }		
	}

	@SuppressWarnings("unchecked")
	private static void loadLine(Section section, NodeList xmlLines){
		Line line = null;
		for(int i=0; i< xmlLines.getLength(); i++){ //iterate sections
			if(xmlLines.item(i).getNodeType()== Node.ELEMENT_NODE){
				line = new Line(section);
				fillLine(line, xmlLines.item(i).getAttributes());
				NodeList nl = xmlLines.item(i).getChildNodes();
				loadCell(line, nl);
				section.addLine(line);
				
			}
	    }		
		
	}
	
	@SuppressWarnings("unchecked")
	private static void loadCell(Line line, NodeList xmlCells){
		Cell cell = null;
		for(int i=0; i< xmlCells.getLength(); i++){ //iterate sections
			if(xmlCells.item(i).getNodeType()== Node.ELEMENT_NODE){
				cell = new Cell(line);				
				fillCell(cell, xmlCells.item(i).getAttributes());
				//logger.info("Parsenado la celda: " + cell.getId());
				line.addCell(cell);				
			}
	    }		
	}

	@SuppressWarnings("unchecked")
	private static void loadFormTriggers(Form form, NodeList xmlTrigges) {
		Trigger trigger = null;
		for(int i=0; i<xmlTrigges.getLength(); i++){
			if(xmlTrigges.item(i).getNodeType() == Node.ELEMENT_NODE){
				trigger = new Trigger();			
				fillTrigger(trigger,xmlTrigges.item(i).getAttributes());
				form.addTrigger(trigger);
			}
		}
	}
	
	private static void fillTrigger(Trigger trigger, NamedNodeMap attributes) {
		trigger.setName(attributes.getNamedItem("name").getNodeValue());
		trigger.setCell(attributes.getNamedItem("cellTargetId").getNodeValue());
		trigger.setFormula(attributes.getNamedItem("formula").getNodeValue());
		trigger.setOrder(new Integer(attributes.getNamedItem("order").getNodeValue()));

		if(attributes.getNamedItem("condition") != null){
			trigger.setCondition(attributes.getNamedItem("condition").getNodeValue());
		}			

	}

	private static void fillSection(Section section, NamedNodeMap attrs){
		section.setId(attrs.getNamedItem("id").getNodeValue());
		if(attrs.getNamedItem("name") != null){
			section.setName(attrs.getNamedItem("name").getNodeValue());
		}
		if(attrs.getNamedItem("description") != null){
			section.setDescription(attrs.getNamedItem("description").getNodeValue());
		}
		if(attrs.getNamedItem("order") != null){
			section.setOrder(new Integer(attrs.getNamedItem("order").getNodeValue()));
		}		
	}
	
	private static void fillLine(Line line, NamedNodeMap attrs){
		line.setId(attrs.getNamedItem("id").getNodeValue());
		if(attrs.getNamedItem("name") != null){
			line.setName(attrs.getNamedItem("name").getNodeValue());
		}
		if(attrs.getNamedItem("description") != null){
			line.setDescription(attrs.getNamedItem("description").getNodeValue());
		}
		if(attrs.getNamedItem("order") != null){
			line.setOrder(new Integer(attrs.getNamedItem("order").getNodeValue()));
		}
	}

	private static void fillCell(Cell cell, NamedNodeMap attrs){
		cell.setId(attrs.getNamedItem("id").getNodeValue());
		if(attrs.getNamedItem("col") != null){
			cell.setCol(new Integer(attrs.getNamedItem("col").getNodeValue()));
		}
		if(attrs.getNamedItem("type") != null){
			cell.setType(attrs.getNamedItem("type").getNodeValue());
		}
		if(attrs.getNamedItem("opaque") != null){
			cell.setOpaque(Boolean.parseBoolean(attrs.getNamedItem("opaque").getNodeValue()));
		}
		if(attrs.getNamedItem("readOnly") != null){
			cell.setReadOnly(Boolean.parseBoolean(attrs.getNamedItem("readOnly").getNodeValue()));
		}
		if(attrs.getNamedItem("calculable") != null){
			cell.setCalculable(Boolean.parseBoolean(attrs.getNamedItem("calculable").getNodeValue()));
		}
		if(attrs.getNamedItem("additionalDescription") != null){
			cell.setAdditionalDescription(attrs.getNamedItem("additionalDescription").getNodeValue());
		}
		if(attrs.getNamedItem("alignAddtionalDescription") != null){
			cell.setAlignAditionalDescription(attrs.getNamedItem("alignAddtionalDescription").getNodeValue());
		}

		if(attrs.getNamedItem("choices") != null){
			cell.setChoices(attrs.getNamedItem("choices").getNodeValue());
		}	
		
		if(attrs.getNamedItem("events") != null){
			cell.setEvents(attrs.getNamedItem("events").getNodeValue());
		}

		if(attrs.getNamedItem("colSpan") != null){
			cell.setColSpan(Integer.parseInt(attrs.getNamedItem("colSpan").getNodeValue()));
		}		

		if(attrs.getNamedItem("xmlTagName") != null){
			cell.setXmlTagName(attrs.getNamedItem("xmlTagName").getNodeValue());
		}
		
		if(attrs.getNamedItem("staticValue") != null){
			cell.setStaticValue(Boolean.parseBoolean(attrs.getNamedItem("staticValue").getNodeValue()));
		}

	}
	
	public static Set<Program> parseMenu(InputStream is, List userRoles){
        try{
            DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            org.w3c.dom.Document doc = db.parse(is);            
            Element e = doc.getDocumentElement();
            
            if (e != null && e.getNodeName().equals(XML_MENU)){

            	NodeList xmlPrograms = e.getElementsByTagName(XML_PROGRAM);
                return loadPrograms(xmlPrograms, userRoles);

            } 

        }catch (Throwable e){
            System.out.println(System.getProperty("java.vm.version"));
            System.out.println(System.getProperty("java.specification.version"));
            e.printStackTrace();
        }
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private static Set<Program> loadPrograms(NodeList xmlPrograms, List userRoles){
		
		Set<Program> programs = new TreeSet();
		
		Program program = null;
		for(int i=0; i< xmlPrograms.getLength(); i++){ //iterate programs
			if(xmlPrograms.item(i).getNodeType()== Node.ELEMENT_NODE){
				program = new Program();

				NamedNodeMap attrs = xmlPrograms.item(i).getAttributes();
				if(attrs.getNamedItem("rolesAllowed")==null || havePrivileges(attrs.getNamedItem("rolesAllowed").getNodeValue(), userRoles )){

					program.setName(attrs.getNamedItem("name").getNodeValue());
					program.setOrder(Integer.parseInt(attrs.getNamedItem("order").getNodeValue()));
					
					logger.info("Parsenado el programa: " + program.getName());
					
					if(attrs.getNamedItem("description") != null){
						program.setDescription(attrs.getNamedItem("description").getNodeValue());
					}
	
					if(attrs.getNamedItem("active") != null){
						program.setActive(Boolean.parseBoolean(attrs.getNamedItem("active").getNodeValue()));					
					}
					
					//ahora por cada programa hay que parsear las acciones
					NodeList xmlActions = xmlPrograms.item(i).getChildNodes();
					program.setActions(loadAction(xmlActions,userRoles));
					
					//al final agrego el programa al Set
					programs.add(program);
				}
			}
	    }
		return programs;
	}
	public static Set<Program> parseMenu2(InputStream is, List userRoles){
        try{
            DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            org.w3c.dom.Document doc = db.parse(is);            
            Element e = doc.getDocumentElement();
            
            if (e != null && e.getNodeName().equals(XML_MENU)){

            	NodeList xmlPrograms = e.getElementsByTagName(XML_PROGRAM);
                return loadPrograms2(xmlPrograms, userRoles);

            } 

        }catch (Throwable e){
            System.out.println(System.getProperty("java.vm.version"));
            System.out.println(System.getProperty("java.specification.version"));
            e.printStackTrace();
        }
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	private static Set<Program> loadPrograms2(NodeList xmlPrograms, List userRoles){
		
		Set<Program> programs = new TreeSet();
		
		Program program = null;
		for(int i=0; i< xmlPrograms.getLength(); i++){ //iterate programs
			if(xmlPrograms.item(i).getNodeType()== Node.ELEMENT_NODE){
				program = new Program();

				NamedNodeMap attrs = xmlPrograms.item(i).getAttributes();
				if(attrs.getNamedItem("rolesAllowed")==null || havePrivileges(attrs.getNamedItem("rolesAllowed").getNodeValue(), userRoles )){

					program.setName(attrs.getNamedItem("name").getNodeValue());
					program.setOrder(Integer.parseInt(attrs.getNamedItem("order").getNodeValue()));
					
					logger.info("Parsenado el programa0: " + program.getName());
					
					if(!program.getName().equals("Nuevo formulario") || !program.getName().equals("Realizar Pagos")){
					
						if(attrs.getNamedItem("description") != null){
							program.setDescription(attrs.getNamedItem("description").getNodeValue());
						}
		
						if(attrs.getNamedItem("active") != null){
							program.setActive(Boolean.parseBoolean(attrs.getNamedItem("active").getNodeValue()));					
						}
						
						//ahora por cada programa hay que parsear las acciones
						NodeList xmlActions = xmlPrograms.item(i).getChildNodes();
						program.setActions(loadAction2(xmlActions,userRoles));
						
						//al final agrego el programa al Set
						programs.add(program);
					}
				}
			}
	    }
		return programs;
	}
	
	@SuppressWarnings("unchecked")
	private static Set<Action> loadAction2(NodeList xmlAction, List userRoles){
	
	
		if(xmlAction == null || xmlAction.getLength() == 0)
			return null;
		
		Set <Action> actions = new TreeSet();
		
		for(int i=0; i< xmlAction.getLength(); i++){ //iterate actions
			Action action = null;
			if(xmlAction.item(i).getNodeType()== Node.ELEMENT_NODE){
				action = new Action();

				NamedNodeMap attrs = xmlAction.item(i).getAttributes();

				if(attrs.getNamedItem("rolesAllowed")==null || havePrivileges(attrs.getNamedItem("rolesAllowed").getNodeValue(), userRoles )){
				
					action.setName(attrs.getNamedItem("name").getNodeValue());
					action.setOrder(Integer.parseInt(attrs.getNamedItem("order").getNodeValue()));
					
					logger.info("Parsenado action: " + action.getName());

					if(!action.getName().equals("Nuevo formulario") && !action.getName().equals("Realizar Pagos")){
						if(attrs.getNamedItem("url") != null){
							action.setUrl(attrs.getNamedItem("url").getNodeValue());
						}
		
						if(attrs.getNamedItem("description") != null){
							action.setDescription(attrs.getNamedItem("description").getNodeValue());
						}
		
						if(attrs.getNamedItem("active") != null){
							action.setActive(Boolean.parseBoolean(attrs.getNamedItem("active").getNodeValue()));					
						}
		
						action.setSubactions(loadAction2(xmlAction.item(i).getChildNodes(),userRoles));
									
						actions.add(action);
					}
				}//whitout privileges
			}
		}
		return actions;
	}

	
	private static boolean havePrivileges(String requiredRoles, List userRoles){

		//se asume que si rolesAllowed esta vacío, es porque es de dominio público
		if(requiredRoles == null ||  requiredRoles.equals(""))
			return true;
		
		String[] rrs = requiredRoles.split(";");

		Iterator it = userRoles.iterator();
		while(it.hasNext()){
			for(int i=0; i<rrs.length; i++){
				logger.info("Verify permission to " + rrs[i]);
				if(((Role)it.next()).getRoleName().equals(rrs[i])){
					return true;
				}
			}
		}
		
		return false;
	}
	
	@SuppressWarnings("unchecked")
	private static Set<Action> loadAction(NodeList xmlAction, List userRoles){
	
	
		if(xmlAction == null || xmlAction.getLength() == 0)
			return null;
		
		Set <Action> actions = new TreeSet();
		
		for(int i=0; i< xmlAction.getLength(); i++){ //iterate actions
			Action action = null;
			if(xmlAction.item(i).getNodeType()== Node.ELEMENT_NODE){
				action = new Action();

				NamedNodeMap attrs = xmlAction.item(i).getAttributes();

				if(attrs.getNamedItem("rolesAllowed")==null || havePrivileges(attrs.getNamedItem("rolesAllowed").getNodeValue(), userRoles )){
				
					action.setName(attrs.getNamedItem("name").getNodeValue());
					action.setOrder(Integer.parseInt(attrs.getNamedItem("order").getNodeValue()));
					
					logger.info("Parsenado action: " + action.getName());

					if(attrs.getNamedItem("url") != null){
						action.setUrl(attrs.getNamedItem("url").getNodeValue());
					}
	
					if(attrs.getNamedItem("description") != null){
						action.setDescription(attrs.getNamedItem("description").getNodeValue());
					}
	
					if(attrs.getNamedItem("active") != null){
						action.setActive(Boolean.parseBoolean(attrs.getNamedItem("active").getNodeValue()));					
					}
	
					action.setSubactions(loadAction(xmlAction.item(i).getChildNodes(),userRoles));
								
					actions.add(action);
				}//whitout privileges
			}
		}
		return actions;
	}
	
	public static SimpleForm parseUploadFileForm(InputStream is) throws PykasuParsingException{
		return null;
//        try{		
//        	
//        	// parse an XML document into a DOM tree
//    	    DocumentBuilder parser = DocumentBuilderFactory.newInstance().newDocumentBuilder();
//			Document document = parser.parse(is);
//			
//		    // create a SchemaFactory capable of understanding WXS schemas
////		    SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);	
//			
//		    
//		    // load a WXS schema, represented by a Schema instance
//		    Source schemaFile = new StreamSource(Parser.class.getClassLoader().getResourceAsStream("forms/taxform.xsd"));
//		    
//		    System.out.println("El esquema file: " + schemaFile.getClass().toString());
//		    javax.xml.transform.stream.StreamSource ss = (javax.xml.transform.stream.StreamSource)schemaFile;
//		    
//		    //Source schemaFile = new StreamSource(new File("c:/java/me/pykasu/pykasu-ejb/src/related-files/schema/taxform.xsd"));
//		    Schema schema = factory.newSchema(schemaFile);
//		    System.out.println("factory:"+factory.getClass().toString());
//		    System.out.println("schema:"+schema.getClass().toString());
//		    
//		    // create a Validator instance, which can be used to validate an instance document
//		    Validator validator = schema.newValidator();
//		    System.out.println("validator:"+validator.getClass().toString());
//		    // validate the DOM tree
//		    validator.validate(new DOMSource(document));
//
//            return parseUploadFileForm(document);
//        }catch (Throwable e){
//            System.out.println(System.getProperty("java.vm.version"));
//            System.out.println(System.getProperty("java.specification.version"));
//            e.printStackTrace();
//            throw new PykasuParsingException(e.getMessage());
//        }
//
	}

	private static SimpleForm parseUploadFileForm(org.w3c.dom.Document doc) throws PykasuParsingException{
		SimpleForm form = new SimpleForm();
        Element e = doc.getDocumentElement();
        
        
        
       try{
        	if (e != null && e.getNodeName().equals(XML_DECLARATION)){
	        	
	        	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	        	java.util.Date date;
	
	        	form.setName(e.getAttribute(XML_ATTR_FORM));
	        	form.setVersion(e.getAttribute(XML_ATTR_VERSION));
	        	form.setId(e.getAttribute(XML_ATTR_FORM));
	        	
				date = sdf.parse(e.getAttribute(XML_ATTR_DATE));
	        	Calendar c = Calendar.getInstance();
	        	c.setTime(date);
	        	form.setDate(c);
	        	
	        	
	        	NodeList nodes = null;
	        	Node node = null;

	        	//--RUC
	        	nodes = e.getElementsByTagName(XML_RUC);
	        	if(nodes.getLength() != 1){
	        		throw new PykasuParsingException("Hay mas de un tag RUC");	        		
	        	}
	        	node = nodes.item(0);
	        	form.setRuc(node.getFirstChild().getNodeValue());

	        	//--DV
	        	nodes = e.getElementsByTagName(XML_DV);
	        	if(nodes.getLength() != 1){
	        		throw new PykasuParsingException("Hay mas de un tag DV");
	        	}
	        	node = nodes.item(0);
	        	form.setDv(node.getFirstChild().getNodeValue());
	        	
	        	//--DETALLES
	            nodes = e.getElementsByTagName(XML_DETAILS);
	        	if(nodes.getLength() != 1){
	        		throw new PykasuParsingException("Hay mas de un tag DV");
	        	}
	        	node = nodes.item(0);
	            
	            NodeList xmlDetails = node.getChildNodes();
	            loadFormDetails(form, xmlDetails);

        	}

        }catch (ParseException e1) {
			e1.printStackTrace();
			logger.error("Error de parseo de archivo: ",  e1);
			throw new PykasuParsingException(e1.getMessage());
		}
        return form;        
        

	}
	
	private static void loadFormDetails(SimpleForm form, NodeList xmlDetails) throws PykasuParsingException{
		Node node = null;
		Cell cell = null;
		try {

			Cell ppn = new Cell();
			ppn.setType(Cell.STRING);
			ppn.setId("prePrintedNumber");
			ppn.setData("100088109");
			form.addCell(ppn);

			for(int i=0; i<xmlDetails.getLength(); i++){
				node = xmlDetails.item(i);
				if(node.getNodeType() != Node.TEXT_NODE){
					cell = new Cell();
					if(node.getNodeName() != null && node.getFirstChild() != null && node.getFirstChild().getNodeValue() != null){
						cell.setId(node.getNodeName());
						cell.setType(Cell.NUMBER);
						cell.setData(node.getFirstChild().getNodeValue());
						form.addCell(cell);

						
						//en la celda C4 viene el periodo fiscal, en el formato YYYYMM
						if(cell.getId() == "C4"){
							
							if(cell.getData() == null ||  (node.getFirstChild().getNodeValue().toString().trim().length() != 6 && node.getFirstChild().getNodeValue().toString().trim().length() != 4)) 
								throw new PykasuParsingException("Periodo fiscal (Celda C4) no tiene el formato previsto. Valor recibido:" + node.getFirstChild().getNodeValue());
							
							String fiscalPeriod = node.getFirstChild().getNodeValue().toString().trim();//String.valueOf((Double)cell.getData());
							Cell fpy = new Cell();
							fpy.setType(Cell.NUMBER);
							fpy.setId("fiscalPeriodYear");
							fpy.setData(new Integer(Integer.parseInt(fiscalPeriod.trim().substring(0, 4))));
							form.addCell(fpy);
							if(fiscalPeriod.length() == 6){
								Cell fpm = new Cell();
								fpm.setType(Cell.NUMBER);
								fpm.setId("fiscalPeriodMounth");
								fpm.setData(new Integer(Integer.parseInt(fiscalPeriod.trim().substring(5, 6))));
								form.addCell(fpm);
							}
						}
					}
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new PykasuParsingException(e.getMessage());

		}
	}
	
	private  static String slurp (InputStream in) throws IOException {
        StringBuffer out = new StringBuffer();
         byte[] b = new byte[4096];
         for (int n; (n = in.read(b)) != -1;) {
             out.append(new String(b, 0, n));
         }
         return out.toString();
     }

	public static void main(String[] args) {

		
//		InputStream is = Parser.class.getClassLoader().getResourceAsStream("forms/taxform.xsd");
//		if(is == null){
//			System.out.println("no se encontro el archivo");
//		}
//		byte[] buf = new byte[1024];
//        int len;
//        try {
//			while ((len = is.read(buf)) > 0) {
//				System.out.write(buf, 0, len);
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}	 
		SimpleForm form;
		try {
			form = Parser.parseUploadFileForm(new FileInputStream(
										new File("c:\\Users\\Pablo\\Desktop\\form120Nuevo.xml"))
									);
			System.out.println(form);			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (PykasuParsingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		Set <Program> menu = null;
//		try {
//			menu = Parser.parseMenu(new FileInputStream(new File("c:/java/workspace/Pykasu/related-files/menu.xml")),null);
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		}
//		
//		Iterator it = menu.iterator();
//		while(it.hasNext()){
//			System.out.println((Program)it.next());
//		}
		
		
//		Form form;
//		try {
//			form = Parser.parseForm(new FileInputStream(
//										new File("c:\\pablo\\FORM850C.xml"))
//									);
//			System.out.println(form);			
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		}
	}
}

