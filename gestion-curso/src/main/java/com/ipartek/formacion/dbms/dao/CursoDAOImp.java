package com.ipartek.formacion.dbms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.ipartek.formacion.dbms.mappers.CursoMapper;
import com.ipartek.formacion.dbms.persistence.Curso;

@Repository("cursoDaoImp")
public class CursoDAOImp implements CursoDAO {

	@Autowired
	private DataSource dataSource;
	private JdbcTemplate template;
	private SimpleJdbcCall jdbcCall;
	private Logger logger = LoggerFactory.getLogger(CursoDAOImp.class);

	@Autowired // es lo mismo que @Inject
	@Qualifier("mysqlDataSource") // es lo mismo que @Inject
	@Override
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.template = new JdbcTemplate(dataSource);

	}

	@Override
	public Curso create(Curso curso) {
		final String SQL = "cursoCreate";
		this.jdbcCall = new SimpleJdbcCall(dataSource);
		// se asigna el nombre del procedimiento almacenado
		jdbcCall.withProcedureName(SQL);

		// crear un mapa con los parametros de procedimiento almacenado
		SqlParameterSource in = new MapSqlParameterSource().addValue("pnomCurso", curso.getNombre())
				.addValue("pcodCurso", curso.getCodCurso());

		logger.info(curso.toString());
		// se ejecuta la consulta
		Map<String, Object> out = jdbcCall.execute(in);

		// en out se han recogido los parametros out de la consulta a BBDD.
		curso.setCodigo((Integer) out.get("pcodigo"));

		return curso;
	}

	@Override
	public List<Curso> getAll() {
		final String SQL = "CALL cursogetAll();";
		this.template = new JdbcTemplate(dataSource);
		List<Curso> cursos = null;
		try {
			cursos = template.query(SQL, new CursoMapper());
			logger.info("Tamaño: " + cursos.size());
		} catch (EmptyResultDataAccessException e) {
			logger.trace(e.getMessage());
			cursos = new ArrayList<Curso>();
		}

		return cursos;
	}

	@Override
	public Curso getById(int codigo) {
		Curso curso = null;
		this.jdbcCall = new SimpleJdbcCall(dataSource);
		final String SQL = "CALL cursogetById(?)";
		try {
			curso = template.queryForObject(SQL, new CursoMapper(), new Object[] { codigo });
		} catch (EmptyResultDataAccessException e) {
			logger.info("No se ha encontrado curso para codigo" + codigo + " " + e.getMessage());
		}
		return curso;
	}

	@Override
	public Curso update(Curso curso) {
		final String SQL = "cursoUpdate";
		this.jdbcCall = new SimpleJdbcCall(dataSource);

		jdbcCall.withProcedureName(SQL);

		SqlParameterSource in = new MapSqlParameterSource().addValue("pcodigo", curso.getCodigo())
				.addValue("pnomCurso", curso.getNombre()).addValue("pcodCurso", curso.getCodCurso());

		logger.info(curso.toString());

		jdbcCall.execute(in);
		return curso;
	}

	@Override
	public void delete(int codigo) {
		final String SQL = "cursoDelete";
		this.jdbcCall = new SimpleJdbcCall(dataSource);

		SqlParameterSource in = new MapSqlParameterSource().addValue("pcodigo", codigo);

		jdbcCall.withProcedureName(SQL);
		logger.info(String.valueOf(codigo));

		jdbcCall.execute(in);

	}

	@Override
	public Curso getByCodCurso(String codCurso) {
		Curso curso = null;
		this.jdbcCall = new SimpleJdbcCall(dataSource);
		final String SQL = "CALL cursogetByCodCurso(?)";
		try {
			curso = template.queryForObject(SQL, new CursoMapper(), new Object[] { codCurso });
		} catch (EmptyResultDataAccessException e) {
			logger.info("No se ha encontrado curso para codigo" + codCurso + " " + e.getMessage());
		}
		return curso;
	}

}
