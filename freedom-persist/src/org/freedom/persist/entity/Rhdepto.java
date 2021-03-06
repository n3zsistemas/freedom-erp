package org.freedom.persist.entity;

// Generated 12/05/2014 09:11:34 by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Rhdepto generated by hbm2java
 */
@Entity
@Table(name = "RHDEPTO")
public class Rhdepto implements java.io.Serializable {

	private RhdeptoId id;
	private String descdep;
	private Date dtins;
	private Date hins;
	private String idusuins;
	private Date dtalt;
	private Date halt;
	private String idusualt;
	private Set rhempregados = new HashSet(0);

	public Rhdepto() {
	}

	public Rhdepto(RhdeptoId id, String descdep, Date dtins, Date hins,
			String idusuins) {
		this.id = id;
		this.descdep = descdep;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
	}

	public Rhdepto(RhdeptoId id, String descdep, Date dtins, Date hins,
			String idusuins, Date dtalt, Date halt, String idusualt,
			Set rhempregados) {
		this.id = id;
		this.descdep = descdep;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
		this.dtalt = dtalt;
		this.halt = halt;
		this.idusualt = idusualt;
		this.rhempregados = rhempregados;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "coddep", column = @Column(name = "CODDEP", nullable = false)),
			@AttributeOverride(name = "codfilial", column = @Column(name = "CODFILIAL", nullable = false)),
			@AttributeOverride(name = "codemp", column = @Column(name = "CODEMP", nullable = false)) })
	public RhdeptoId getId() {
		return this.id;
	}

	public void setId(RhdeptoId id) {
		this.id = id;
	}

	@Column(name = "DESCDEP", nullable = false, length = 50)
	public String getDescdep() {
		return this.descdep;
	}

	public void setDescdep(String descdep) {
		this.descdep = descdep;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTINS", nullable = false, length = 10)
	public Date getDtins() {
		return this.dtins;
	}

	public void setDtins(Date dtins) {
		this.dtins = dtins;
	}

	@Temporal(TemporalType.TIME)
	@Column(name = "HINS", nullable = false, length = 8)
	public Date getHins() {
		return this.hins;
	}

	public void setHins(Date hins) {
		this.hins = hins;
	}

	@Column(name = "IDUSUINS", nullable = false, length = 8)
	public String getIdusuins() {
		return this.idusuins;
	}

	public void setIdusuins(String idusuins) {
		this.idusuins = idusuins;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTALT", length = 10)
	public Date getDtalt() {
		return this.dtalt;
	}

	public void setDtalt(Date dtalt) {
		this.dtalt = dtalt;
	}

	@Temporal(TemporalType.TIME)
	@Column(name = "HALT", length = 8)
	public Date getHalt() {
		return this.halt;
	}

	public void setHalt(Date halt) {
		this.halt = halt;
	}

	@Column(name = "IDUSUALT", length = 8)
	public String getIdusualt() {
		return this.idusualt;
	}

	public void setIdusualt(String idusualt) {
		this.idusualt = idusualt;
	}

	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "rhdepto")
	public Set getRhempregados() {
		return this.rhempregados;
	}

	public void setRhempregados(Set rhempregados) {
		this.rhempregados = rhempregados;
	}
*/
}
