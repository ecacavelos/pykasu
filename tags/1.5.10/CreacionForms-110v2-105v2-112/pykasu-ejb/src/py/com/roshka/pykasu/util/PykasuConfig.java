package py.com.roshka.pykasu.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class PykasuConfig {

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(PykasuConfig.class);
	
	protected static Properties prop;
	
	public static String _infoText = null;
	
	static{
		reload();
	}

	public static void reload(){
		prop = new Properties();
		try {
			URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
			prop.load(url.openStream());;

		} catch (IOException e) {
			logger.warn("Error al recuperar el archivo de propiedades para obtener el valor de " + py.com.roshka.pykasu.util.Globals.RAFFLE_BEGIN + " o " + py.com.roshka.pykasu.util.Globals.RAFFLE_END);		
		};	
		
		_infoText = null;
		
	}
	
	protected static Properties getProperties(){
		if(prop == null){
			Properties prop = new Properties();
			try {
				URL url = new URL(py.com.roshka.pykasu.util.Globals.PYKASU_PROPERTIES);
				prop.load(url.openStream());;

			} catch (IOException e) {
				logger.warn("Error al recuperar el archivo de propiedades para obtener el valor de " + py.com.roshka.pykasu.util.Globals.RAFFLE_BEGIN + " o " + py.com.roshka.pykasu.util.Globals.RAFFLE_END);		
			};	
			
			
		}
		return prop;
	}
	
	public static String getInfoText(){
		if(_infoText == null){
			String fileName =  getProperties().getProperty("info.file");
			if(fileName == null){
				logger.info("No se encontro ubicacion del archivo de INFO");
				return "";
			}
			try {
				_infoText = readFileAsString(fileName);
			} catch (IOException e) {
				logger.error("No se pudo leer el archivo de INFO",e);
				return "";
			}
		}
		return _infoText;
	}
	
	public static boolean showInfo(){
		getInfoText();
		return (_infoText != null) && (_infoText.trim().length() > 0);
	}
	
    private static String readFileAsString(String filePath)
    throws java.io.IOException{
        StringBuffer fileData = new StringBuffer(1000);
        BufferedReader reader = new BufferedReader(
                new FileReader(filePath));
        char[] buf = new char[1024];
        int numRead=0;
        while((numRead=reader.read(buf)) != -1){
            String readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[1024];
        }
        reader.close();
        return fileData.toString();
    }

}
