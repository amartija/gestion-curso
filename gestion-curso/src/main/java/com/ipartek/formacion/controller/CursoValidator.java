package com.ipartek.formacion.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ipartek.formacion.dbms.persistence.Curso;
import com.ipartek.formacion.service.CursoService;

public class CursoValidator implements Validator {

	@Value("${curso.nombre.size.min}")
	private int nombreTamMin;
	@Value("${curso.nombre.size.max}")
	private int nombreTamMax;
	@Value("${curso.codCurso.size.min}")
	private int codCursoTamMin;
	@Value("${curso.codCurso.size.max}")
	private int codCursoTamMax;

	@Inject
	private CursoService cs;

	@Override
	public boolean supports(Class<?> paramClass) {
		return Curso.class.equals(paramClass);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nombre", "form.nombreRequerido",
				"tiene que introducirse un nombre");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codCurso", "form.apellidoRequerido",
				"tienen que introducirse apellidos");

		Curso curso = (Curso) obj;
		if (curso.getCodigo() < Curso.CODIGO_NULO) {
			errors.rejectValue("codigo", "valorNegativo", new Object[] { "'codigo'" },
					"no puede ser menos que" + Curso.CODIGO_NULO);

		}

		/*
		 * if (curso.getNombre().length() > nombreTamMax ||
		 * curso.getNombre().length() < nombreTamMin) {
		 * 
		 * errors.rejectValue("nombre", "form.nombreValidado", new Object[] {
		 * nombreTamMin, nombreTamMax },
		 * "El nombre tiene la longitud incorrecta"); }
		 * 
		 * if (curso.getApellidos().length() > cursoCodTamMax ||
		 * curso.getApellidos().length() < cursoCodTamMin) {
		 * 
		 * errors.rejectValue("apellidos", "form.apellidosValidado", new
		 * Object[] { cursoCodTamMin, cursoCodTamMax },
		 * "Los apellidos son incorrectos"); }
		 */

	}

}
