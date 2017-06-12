package com.ipartek.formacion.api.webserver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ipartek.formacion.dbms.persistence.Curso;
import com.ipartek.formacion.service.CursoService;

@CrossOrigin(origins = "*", maxAge = 3600, methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT,
		RequestMethod.DELETE })
@RestController
@RequestMapping("/api")
public class CursoRestController {

	@Autowired
	CursoService cs;

	@RequestMapping(value = "/{codigo}", method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Curso> getById(@PathVariable("codigo") int codigo) {

		Curso curso = cs.getById(codigo);

		ResponseEntity<Curso> response = null;

		if (curso == null) {

			response = new ResponseEntity<Curso>(HttpStatus.NOT_FOUND);

		} else {

			response = new ResponseEntity<Curso>(curso, HttpStatus.OK);

		}

		return response;

	}

	@RequestMapping(method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<Curso>> getAll() {

		List<Curso> cursos = cs.getAll();
		ResponseEntity<List<Curso>> response = null;

		if (cursos == null || cursos.isEmpty()) {

			response = new ResponseEntity<List<Curso>>(HttpStatus.NO_CONTENT);

		} else {

			response = new ResponseEntity<List<Curso>>(cursos, HttpStatus.OK);

		}

		return response;
	}

}
