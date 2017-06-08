package com.ipartek.formacion.service;

import java.util.List;

import com.ipartek.formacion.dbms.dao.CursoDAO;
import com.ipartek.formacion.dbms.persistence.Curso;

public interface CursoService {

	public Curso create(Curso curso);

	public Curso getById(int codigo);

	public List<Curso> getAll();

	public Curso update(Curso curso);

	public void delete(int codigo);

	public void setCursoDAO(CursoDAO cursoDao);

}
