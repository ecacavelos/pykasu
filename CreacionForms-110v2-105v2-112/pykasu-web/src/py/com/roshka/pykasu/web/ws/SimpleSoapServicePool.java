package py.com.roshka.pykasu.web.ws;

import java.lang.reflect.Method;
import java.util.LinkedList;

public class SimpleSoapServicePool {
	
	private LinkedList queue;
	private boolean initialized = false;

	public SimpleSoapServicePool(Class clazz, int size, String url, String pname) 
	{
		queue = new LinkedList();
		// initialize n elements
		try {
			Method m = clazz.getDeclaredMethod("setEndpointAddress", new Class[] { String.class, String.class });
			for (int i = 0; i < size; i++) {
				Object ni = clazz.newInstance();
				m.invoke(ni, new Object[] { pname, url } );
				queue.addLast(ni);
			}
			
			this.initialized = true;
		} catch (Exception e) {
			// DO NOT USE LOGGER - USE SYSERR - 
			System.err.println("Panic! Can't start simple soap service pool");
			e.printStackTrace(System.err);
		}
	}
	
	public boolean isInitialized() {
		return initialized;
	}
	
	public Object getService() throws InterruptedException
	{
		Object ret = null;
		if (this.initialized)
			synchronized(queue) {
				ret = queue.removeFirst();
			}
		return ret;
	}
	
	public void returnService(Object service) throws InterruptedException
	{
		synchronized(queue) {
			queue.addLast(service);
		}
	}
	
}