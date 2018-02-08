/*
 * Copyright (c) 2018 SSI Schaefer Noell GmbH
 *
 * $Header: $
 */

package com.ssn.core;

import com.ssn.worldcup.model.Model;
import com.ssn.worldcup.model.ModelImpl;

/**
 * @author <a href="mailto:rveina@ssi-schaefer-noell.com">rveina</a>
 * @version $Revision: $, $Date: $, $Author: $
 */

public class ApplicationFactory {
	private static ApplicationFactory instance;
	private Model model;

	private ApplicationFactory() {
		this.model = new ModelImpl();
	}

	public static ApplicationFactory getInstance() {
		if (instance == null) {
			instance = new ApplicationFactory();
		}
		return instance;
	}

	public Model getModel() {
		return model;
	}
}
