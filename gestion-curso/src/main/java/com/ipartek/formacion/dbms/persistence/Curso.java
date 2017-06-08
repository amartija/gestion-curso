package com.ipartek.formacion.dbms.persistence;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Curso implements Serializable, Comparable<Curso> {

	public static final int CODIGO_NULO = -1;
	private int codigo;
	private String nombre;
	private String codCurso;

	public Curso() {
		super();
		this.codigo = CODIGO_NULO;
		this.nombre = "";
		this.codCurso = "";

	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {

		this.nombre = nombre;
	}

	/**
	 * @return the codCurso
	 */
	public String getCodCurso() {
		return codCurso;
	}

	/**
	 * @param codCurso
	 *            the codCurso to set
	 */
	public void setCodCurso(String codCurso) {
		this.codCurso = codCurso;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getCodigo() + ", " + this.getNombre() + ", " + this.getCodCurso();
	}

	@Override
	public boolean equals(Object obj) {
		boolean iguales = false;
		if (obj instanceof Curso) {
			Curso c = (Curso) obj;
			if (this.codigo == c.getCodigo()) {
				iguales = true;
			}
		}
		return iguales;
	}

	@Override
	public int compareTo(Curso o) {
		// TODO Auto-generated method stub
		return this.nombre.compareToIgnoreCase(o.getNombre());
	}

}
