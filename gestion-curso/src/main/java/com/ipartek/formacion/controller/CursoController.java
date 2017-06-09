package com.ipartek.formacion.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ipartek.formacion.dbms.persistence.Curso;
import com.ipartek.formacion.service.CursoService;

@Controller
@RequestMapping(value = "/cursos")
public class CursoController {

	@Autowired
	private CursoService cs;

	private static final Logger logger = LoggerFactory.getLogger(CursoController.class);
	private ModelAndView mav = null;

	@Resource(name = "cursoValidator")
	private Validator validator = null;

	@InitBinder
	private void initBinder(WebDataBinder binder) {

		binder.setValidator(validator);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), false, 10));

	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getAll() {

		mav = new ModelAndView("cursos/cursos");

		// cargar la lista de cursos
		List<Curso> cursos = cs.getAll();
		logger.info("entra en el getAll");
		// engacharla al nodelandview
		mav.addObject("listadoCursos", cursos);

		// logger.trace("Pasa por getAll()");

		return mav;

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCurso(Model model, @ModelAttribute("curso") @Validated Curso curso, BindingResult bindingResult) {

		String destino = " ";
		if (bindingResult.hasErrors()) {

			logger.trace("curso tiene errores");
			destino = "cursoform";
		} else {

			destino = "redirect:/cursos";

			if (curso.getCodigo() > Curso.CODIGO_NULO) {
				logger.info(curso.toString());
				cs.update(curso);
			} else {
				logger.info(curso.toString());
				cs.create(curso);
			}
		}
		return destino;
	}

	@RequestMapping(value = "/{id}")
	public ModelAndView getById(@PathVariable("id") int id) {
		mav = new ModelAndView("cursoform");
		mav.addObject("cursp", cs.getById(id));
		return mav;

	}

	@RequestMapping(value = "/deleteCurso/{id}")
	public String deleteCurso(@PathVariable("id") int id) {

		cs.delete(id);

		return "redirect:/cursos";
	}

	@RequestMapping(value = "/addCurso")
	public String addCurso(Model model) {
		model.addAttribute("curso", new Curso());

		return "cursoform";
	}

}
