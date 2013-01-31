package py.com.cbi.pykasu.web.ws.debitos;


import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeConstants;
import javax.xml.datatype.XMLGregorianCalendar;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.xml.datatype.DatatypeFactory;

import py.com.cbi.pykasu.web.ws.cuentas.ArrayOfSdtTriSalOutDet;
import py.com.cbi.pykasu.web.ws.cuentas.SdtTriSalIn;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSal;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalExecute;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalExecuteResponse;
import py.com.cbi.pykasu.web.ws.cuentas.WsTriSalSoapPort;

import java.io.StringReader;
import java.io.StringWriter;
 
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlRootElement;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.wsdlMessageMappingType;

public class Test {

	/**
	 * @param args
	 * @throws DatatypeConfigurationException 
	 */
	public static void main(String[] args) throws DatatypeConfigurationException {
		
		
		/*
		 * 
		 * CONSULTA DE CUENTAS
		 * 
		 * 
		 * */
//		 WsTriSal serviceCuentas = new WsTriSal();
//		 WsTriSalSoapPort portTypeCuentas = serviceCuentas.getWsTriSalSoapPort();
//		 WsTriSalExecute executeCuentas = new WsTriSalExecute(); 
//		 SdtTriSalIn parametrosEntradaCuentas = new SdtTriSalIn();
//		 parametrosEntradaCuentas.setNroDoc("000000002907227");//3745572
//		 parametrosEntradaCuentas.setServicio((byte)7);
//		 parametrosEntradaCuentas.setTipoConsulta((byte)1);
//		 parametrosEntradaCuentas.setTipoDoc("CI");
//		 executeCuentas.setSdtIn(parametrosEntradaCuentas);
//		 WsTriSalExecuteResponse respuestaCuentas =  portTypeCuentas.execute(executeCuentas);
//		 
//		 System.out.println("codigo de respuesta: " + respuestaCuentas.getSdtOut().getCodigoRetorno() + 
//				 			"\nmensaje de retorno: " + respuestaCuentas.getSdtOut().getMensajeRetorno() + 
//				 			"\nnumero de documento: " + respuestaCuentas.getSdtOut().getNroDoc() + 
//				 			"\ntipo documento: " + respuestaCuentas.getSdtOut().getTipDoc());
//
//		 ArrayOfSdtTriSalOutDet detalleCuentas =  respuestaCuentas.getSdtOut().getDetalle();
//		 
//		 int cantCuentas = detalleCuentas.getSdtTriSalOutDet().size();
//		 
//		 for (int i=0 ; i< cantCuentas ; i++){
//			 
//			 System.out.println("cuenta nro:" + i);
//			 System.out.println("saldo a confirmar:" + detalleCuentas.getSdtTriSalOutDet().get(i).getSaldoConfirmar() +
//					            "saldo sobre giro" +   detalleCuentas.getSdtTriSalOutDet().get(i).getSaldoSobregiro() + 
//					            "saldo disponible" +   detalleCuentas.getSdtTriSalOutDet().get(i).getSaldoDisponible() +
//					            "cuenta" +   detalleCuentas.getSdtTriSalOutDet().get(i).getCuenta());
//		 
//		 }
//		 
//		// =============================================================================================================
//	        // Setup JAXB
//	        // =============================================================================================================
//	 
//	        // Create a JAXB context passing in the class of the object we want to marshal/unmarshal
//	        JAXBContext context = null;
//			try {
//				context = JAXBContext.newInstance(WsTriSalExecute.class);
//			} catch (JAXBException e2) {
//				// TODO Auto-generated catch block
//				e2.printStackTrace();
//			}
//	 
//	        // =============================================================================================================
//	        // Marshalling OBJECT to XML
//	        // =============================================================================================================
//	 
//	        // Create the marshaller, this is the nifty little thing that will actually transform the object into XML
//	        Marshaller marshaller = null;
//			try {
//				marshaller = context.createMarshaller();
//			} catch (JAXBException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//	 
//	        // Create a stringWriter to hold the XML
//	        final StringWriter stringWriter = new StringWriter();
//	 
//
//	 
//	        // Marshal the javaObject and write the XML to the stringWriter
//	        try {
//				marshaller.marshal(executeCuentas, stringWriter);
//			} catch (JAXBException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//	 
//	        // Print out the contents of the stringWriter
//	        System.out.println(stringWriter.toString());
		/*
		 * 
		 * CONSULTA DE CUENTAS
		 * 
		 * 
		 * */
			
			 
			 
			 
			 
			 
		/*
		 * 
		 * DEBITO DE CUENTAS
		 * 
		 * 
		 *
		 * NUMEROS PARA PROBAR
		CIÊÊÊÊÊ 000000002490103 1640120
		CIÊÊÊÊÊ 000000002897077 1642478
		CIÊÊÊÊÊ 000000001909795 1642654
		CIÊÊÊÊÊ 000000001429887 1642833
		CIÊÊÊÊÊ 000000000586817 1642903
		CIÊÊÊÊÊ 000000001865957 1643154
		CIÊÊÊÊÊ 000000000970889 1643190
		CIÊÊÊÊÊ 000000000696819 1643217
		CIÊÊÊÊÊ 000000003206510 1643707
		CIÊÊÊÊÊ 000000001094412 1644411
		CIÊÊÊÊÊ 000000000699959 1644769
		CIÊÊÊÊÊ 000000000656684 1644803
		CIÊÊÊÊÊ 000000003407511 1644858
		CIÊÊÊÊÊ 000000001814225 1645358
		CIÊÊÊÊÊ 000000000903399 1645713

		 * 
		* */		
		 WsTriLiq service = new WsTriLiq();
		 WsTriLiqSoapPort portType = service.getWsTriLiqSoapPort();
		 WsTriLiqExecute execute = new WsTriLiqExecute(); 
		 SdtTriLiqIn parametrosEntrada = new SdtTriLiqIn();
		 parametrosEntrada.setComprobante((long)1);
//		 parametrosEntrada.setDocumento(respuestaCuentas.getSdtOut().getNroDoc());
		 parametrosEntrada.setDocumento("ads");
		 parametrosEntrada.setIDFORMULARIO((long)270217);
		 parametrosEntrada.setImporteTotal((double)2.0);//saldo 60036.0//60034.0
		 parametrosEntrada.setImpuesto((short)211);
		 parametrosEntrada.setPeriodo("201105");
		 parametrosEntrada.setResolucion((int)0);
		 parametrosEntrada.setUsuario("000000002907227");
		 
		 //fecha
		 GregorianCalendar gcal = new GregorianCalendar();
		 XMLGregorianCalendar fec = DatatypeFactory.newInstance().newXMLGregorianCalendar(gcal);
		 
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Calendar cal = Calendar.getInstance();				 
		 String fecha_actual = dateFormat.format(cal.getTime());
		 //String[] fec_part = fecha_actual.split("-");
		 //fec.setYear(Integer.parseInt(fec_part[0]));
		 //fec.setMonth(Integer.parseInt(fec_part[1]));
		 //fec.setDay(Integer.parseInt(fec_part[2]));
		 parametrosEntrada.setFechaLiquidacion(birthDateToXML(fecha_actual));
		 //fecha
		 
		 ArrayOfSdtTriLiqInDetalle detalle = new ArrayOfSdtTriLiqInDetalle();
		 SdtTriLiqInDetalle cuenta1 = new SdtTriLiqInDetalle();
//		 cuenta1.setCuenta(respuestaCuentas.getSdtOut().getDetalle().getSdtTriSalOutDet().get(0).getCuenta());
		 cuenta1.setCuenta(23434);
		 cuenta1.setImporte((double)2);
		 detalle.getSdtTriLiqInDetalle().add(cuenta1 );
		 parametrosEntrada.setDetalle(detalle);
		 
		 execute.setSdtTriLi(parametrosEntrada);
		 
		// =============================================================================================================
	        // Setup JAXB
	        // =============================================================================================================
	 
	        // Create a JAXB context passing in the class of the object we want to marshal/unmarshal
	        JAXBContext context2 = null;
			try {
				context2 = JAXBContext.newInstance(WsTriLiqExecute.class);
			} catch (JAXBException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
	 
	        // =============================================================================================================
	        // Marshalling OBJECT to XML
	        // =============================================================================================================
	 
	        // Create the marshaller, this is the nifty little thing that will actually transform the object into XML
	        Marshaller marshaller2 = null;
			try {
				marshaller2 = context2.createMarshaller();
			} catch (JAXBException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	 
	        // Create a stringWriter to hold the XML
	        final StringWriter stringWriter2 = new StringWriter();
	 

	 
	        // Marshal the javaObject and write the XML to the stringWriter
	        try {
				marshaller2.marshal(execute, stringWriter2);
			} catch (JAXBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 
	        // Print out the contents of the stringWriter
	        System.out.println(stringWriter2.toString());
		 
		 WsTriLiqExecuteResponse respuesta =  portType.execute(execute);
		 
		 System.out.println("codigo de respuesta: " + respuesta.getSdtTriLiOut().getCodigoRetorno() + 
				 		    " mensaje de retorno:" + respuesta.getSdtTriLiOut().getCodigoRetorno());
		 
		 		 
	}
	public static XMLGregorianCalendar birthDateToXML(String fecha_actual) throws DatatypeConfigurationException {
		String[] fec_part = fecha_actual.split("-");
        XMLGregorianCalendar xmlGregorianCalendar = DatatypeFactory.newInstance().newXMLGregorianCalendar();
        xmlGregorianCalendar.setYear(Integer.parseInt(fec_part[0]));
        xmlGregorianCalendar.setMonth(Integer.parseInt(fec_part[1]));
        xmlGregorianCalendar.setDay(Integer.parseInt(fec_part[2]));
        xmlGregorianCalendar.setHour(DatatypeConstants.FIELD_UNDEFINED);
        xmlGregorianCalendar.setMinute(DatatypeConstants.FIELD_UNDEFINED);

        return xmlGregorianCalendar;
	}


}
