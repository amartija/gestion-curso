package com.ipartek.formacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipartek.formacion.dbms.dao.CursoDAO;
import com.ipartek.formacion.dbms.persistence.Curso;

@Service
public class CursoServiceImp implements CursoService {

	@Autowired
	private CursoDAO cursoDao;

	@Override
	public Curso create(Curso curso) {

		return cursoDao.create(curso);
	}

	@Override
	public Curso getById(int codigo) {

		return cursoDao.getById(codigo);
	}

	@Override
	public List<Curso> getAll() {

		return cursoDao.getAll();
	}

	@Override
	public Curso update(Curso curso) {

		return cursoDao.update(curso);
	}

	@Override
	public void delete(int codigo) {
		cursoDao.delete(codigo);

	}

	@Override
	public void setCursoDAO(CursoDAO cursoDao) {
		this.cursoDao = cursoDao;

	}

}
