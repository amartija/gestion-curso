package com.ipartek.formacion.dbms.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.ipartek.formacion.dbms.persistence.Curso;

@Repository("cursoDaoImp")
public class CursoDAOImp implements CursoDAO {

	@Override
	public void setDataSource(DataSource dataSource) {
		// TODO Auto-generated method stub

	}

	@Override
	public Curso create(Curso curso) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Curso> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Curso getById(int codigo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Curso update(Curso curso) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int codigo) {
		// TODO Auto-generated method stub

	}

}
