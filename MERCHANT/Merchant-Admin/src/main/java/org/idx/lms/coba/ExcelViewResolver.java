package org.idx.lms.coba;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

public class ExcelViewResolver implements ViewResolver {

	public View resolveViewName(String viewName, Locale locale) throws Exception {
		// TODO Auto-generated method stub
		ExcelView view = new ExcelView();
		return view;
	}

}
