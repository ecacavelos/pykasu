package py.com.roshka.pykasu.interfaces;

import java.util.List;
import java.util.Set;

import py.com.roshka.pykasu.exceptions.FormNotFoundException;
import py.com.roshka.pykasu.persistence.users.User;
import py.com.roshka.pykasu.ui.form.Form;
import py.com.roshka.pykasu.ui.menu.Program;

public interface UIManager {
	public List<Program> getMenu();
}

