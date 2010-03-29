/*
 * Created on Jul 13, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package py.com.roshka.pykasu.web.jsp;

import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import py.com.roshka.pykasu.ui.form.Cell;
import py.com.roshka.pykasu.web.Globals;

/**
 * 
 * @author jrey
 * 
 * @jsp.tag name = "cell"
 * 
 * 
 * 
 */
public class CellTag extends TagSupport {
	private Cell cell;
	private String width;
	private String styleName;
	NumberFormat nf = NumberFormat.getNumberInstance(new Locale("es", "py"));

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(CellTag.class);

	/**
	 * @jsp.attribute rtexprvalue = "true" type =
	 *                "py.com.roshka.pykasu.ui.form.Cell"
	 */
	public Cell getCell() {
		return cell;
	}

	public void setCell(Cell cell) {
		this.cell = cell;
	}

	/**
	 * @jsp.attribute rtexprvalue = "true" type = "java.lang.String"
	 */
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	/**
	 * @jsp.attribute rtexprvalue = "true" type = "java.lang.String"
	 */
	public String getStyleName() {
		return styleName;
	}

	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}

	@Override
	public int doAfterBody() throws JspException {

		return EVAL_PAGE;
	}

	@Override
	public int doEndTag() throws JspException {

		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {

		nf.setMinimumFractionDigits(0);
		nf.setMaximumFractionDigits(0);
		nf.setGroupingUsed(true);

		try {
			JspWriter pw = pageContext.getOut();

			String readOnly = "false";
			String calculableFunction = "";
			String disabled = "false";
			String value = "";
			String position = cell.getAlignAditionalDescription();
			String align = "center";

			String styleName = "default";

			boolean formReadOnly = false;

			if (pageContext.getRequest().getAttribute(
					Globals.FORM_BEAN_READONLY) != null) {

				/*
				 * ((Boolean) pageContext.getRequest().getAttribute(
				 * Globals.FORM_BEAN_READONLY)).booleanValue();
				 */

				cell.setReadOnly(true);

				if (cell.getType().equals(Cell.CHECK)) {
					cell.setType(Cell.FILLED);
					cell.setData("No");
					if (cell.getData() != null) {
						boolean checkValue = ((Boolean) cell.getData())
								.booleanValue();
						if (checkValue)
							cell.setData("Si");
					}

				}

				if (cell.getType().equals(Cell.MULTIPLE)) {
					cell.setChoices(cell.getData().toString());

				}

				if (!cell.getType().equals(Cell.NUMBER)) {
					align = "rigth";
				} else {
					align = "left";
				}
			}

			if (cell.getData() != null) {
				value = cell.getData().toString();
			}
			if (cell.isReadOnly()) {
				readOnly = "true";
				styleName = "readonly";
			}
			if (cell.isOpaque()) {
				disabled = "true";
				styleName = "opaque";
			}
			if (this.styleName != null) {
				styleName = this.styleName;
			}
			if (cell.isCalculable())
				calculableFunction = "lostFocus(this);";

			if (cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.NUMBER)) {
				logger.info(">>" + cell.getId() + " isStaticValue " + cell.isStaticValue());
				if (!cell.isStaticValue()) {
					if (cell.getData().getClass().equals(Double.class)) {
						value = nf.format(((Double) cell.getData()).doubleValue());
					} else if (cell.getData().getClass().equals(Integer.class)) {
						value = nf.format(((Integer) cell.getData()).intValue());
					}
					if (value.equals("0")) {
						value = "";
					}
				}
			} else if (cell.getType().equals(
					py.com.roshka.pykasu.ui.form.Cell.STRING)
					|| cell.getType().equals(
							py.com.roshka.pykasu.ui.form.Cell.LABEL)) {
				value = (String) cell.getData();

			} else if (cell.getType().equals(
					py.com.roshka.pykasu.ui.form.Cell.DATE)) {

				// value = "no tiene fecha";
				value = "";
				if (cell != null
						&& (cell.getDatePattern() == null || cell
								.getDatePattern().trim().equals(""))) {
					cell.setDatePattern("dd/MM/yyyy");

				}

				if (cell.getData() != null
						&& cell.getData() instanceof Calendar) {

					value = new java.text.SimpleDateFormat(cell
							.getDatePattern()).format(new Date(
							((java.util.Calendar) cell.getData())
									.getTimeInMillis()));
				} else if (cell.getData() != null
						&& cell.getData() instanceof Timestamp) {
					value = new java.text.SimpleDateFormat(cell
							.getDatePattern()).format(new Date(
							((Timestamp) cell.getData()).getTime()));
				} else if (cell.getData() != null
						&& cell.getData() instanceof java.util.Date) {
					value = new java.text.SimpleDateFormat(cell
							.getDatePattern()).format(cell.getData());

				}
				/*
				 * if (cell.getData()==null){
				 * 
				 * value = new java.text.SimpleDateFormat(cell.getDatePattern())
				 * .format(new Date(System.currentTimeMillis()));
				 * 
				 * 
				 * }
				 */
			}

			if (cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.LABEL)) {
				value = (String) cell.getData();
				if (cell.getAlignAditionalDescription() == null
						|| cell.getAdditionalDescription().equals(""))
					cell.setAdditionalDescription("&nbsp;");
				pw.print("<label align=\"" + align + "\">"
						+ cell.getAdditionalDescription() + "</label>");

			} else if (cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.CHECK)) {
				value = cell.getData().toString();
				StringBuffer buff = new StringBuffer();
				buff.append("<input type=\"checkbox\" class = \"" + styleName
						+ "\" ");

				if (value.toUpperCase().equals(
						Boolean.TRUE.toString().toUpperCase())) {
					buff.append(" checked");
				}
				if (cell.isOpaque())
					pw.print(" disabled = \"" + disabled.equals("true") + "\"");
				
				buff.append(" name=\"field(" + cell.getId() + ")\"");
				buff.append(" id=\"" + cell.getId() + "\"");
				buff.append(" value=\"true\">");
				pw.print(buff.toString());
			} else if (cell.getType().equals(py.com.roshka.pykasu.ui.form.Cell.MULTIPLE)) {
				
				value = cell.getData().toString();
				String[] choices = cell.getChoices().split(";");
				pw.print("<select name=\"field(" + cell.getId() + ")\" id=\""
						+ cell.getId() + "\" " + " class = \"" + styleName
						+ "\"");

				if (cell.getEvents() != null && cell.getEvents().length() > 0) {

					String events[] = cell.getEvents().split(";");

					for (int eventId = 0; eventId < events.length; eventId++) {

						String eventType = events[eventId].split(":")[0];

						String functions[] = events[eventId].split(":")[1]
								.split("#");

						pw.print(" " + eventType + "=\"");

						for (int functionIndex = 0; functionIndex < functions.length; functionIndex++) {
							if (functionIndex > 0)
								pw.print(", ");
							if (!functions[functionIndex].contains("(")) { // si no
																			// tiene
																			// parametros
																			// al
																			// menos
																			// se
																			// le
																			// pasa
																			// (this).
																			// Si
																			// tiene
																			// parametros,
																			// se
																			// respera
																			// los
																			// que
																			// tiene,
																			// y
																			// NO
																			// se
																			// AGREGA
																			// this
								pw.print(functions[functionIndex] + "(this)");
							}
						}
						if (eventType.toLowerCase().equals("onblur")
								&& calculableFunction != null
								&& calculableFunction.length() > 0) {
							pw.print("," + calculableFunction + "()");
						}
						pw.print("\"");
					}
				} else {
					if (cell.isCalculable())
						pw.print(" onblur=\"" + calculableFunction + "\"");
				}

				pw.print(">");

				for (int choice = 0; choice < choices.length; choice++) {
					String selected = "";

					if (choices[choice].equals(value)
							|| ((value == null || value.equals("")
									&& choice == 0)))
						selected = "selected=\"true\"";

					pw.print("<option value=\"" + choices[choice] + "\"  "
							+ selected + " >");
					pw.print(choices[choice]);
					pw.print("</option>");
				}
				pw.print("</select>");
			} else {
				/*
				 * if (cell.getAdditionalDescription() != null &&
				 * cell.getAlignAditionalDescription().equals("LEFT")){
				 * pw.print("<label
				 * style=\"font-size:8px\">"+cell.getAdditionalDescription
				 * ()+"</label>"); }
				 */
				if (!cell.isOpaque()) {
					pw.print("<input type=\"text\" onfocus=\"setField(this)\"");
					pw.print("name=\"field(" + cell.getId() + ")\" ");
					pw.print(" id = \"" + cell.getId() + "\"");

					if (cell.isOpaque())
						pw.print(" disabled = \"" + disabled.equals("true")
								+ "\"");
					if (cell.isReadOnly())
						pw.print(" readonly = \"" + disabled.equals("true")
								+ "\"");

					if (cell.getType().equals(Cell.NUMBER)) {
						pw.print(" onKeyUp=\"colocarpuntos(this)\"");
					}

					pw.print(" class = \"" + styleName + "\"");

					try {
						if (cell.getEvents() != null
								&& cell.getEvents().length() > 0) {

							String events[] = cell.getEvents().split(";");

							for (int eventId = 0; eventId < events.length; eventId++) {

								String eventType = events[eventId].split(":")[0];

								String functions[] = events[eventId].split(":")[1]
										.split("#");

								pw.print(" " + eventType + "=\"");

								for (int functionIndex = 0; functionIndex < functions.length; functionIndex++) {
									if (functionIndex > 0)
										pw.print(", ");
									if (functions[functionIndex].contains("(")) {
										pw.print(functions[functionIndex]);
									} else {
										pw.print(functions[functionIndex]
												+ "(this)");
									}
								}
								if (eventType.toLowerCase().equals("onblur")
										&& calculableFunction != null
										&& calculableFunction.trim().length() > 0) {
									pw.print("," + calculableFunction);
								}
								pw.print("\"");
							}
						} else {
							pw.print(" onblur=\"" + calculableFunction + "\"");
						}
					} catch (Throwable e) {

					}
					System.out.println(value);
					pw.print(" value = \"" + value + "\"");
					pw.print(" size=\"12\"");
					pw.print(">");
				} else {
//					py.com.roshka.pykasu.ui.form.Form form = (py.com.roshka.pykasu.ui.form.Form) super.pageContext
//							.getRequest().getAttribute(py.com.roshka.pykasu.web.Globals.FORM_BEAN);
//					pw.print("<div style=\"background-image: url(images/hidden" + form.getId() + ".jpg); background-image:repeat-x\"> hola </div>");
				}
			}
		} catch (Exception e) {
			throw new JspException(e);
		}

		return EVAL_PAGE;
	}
}