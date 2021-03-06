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
 * Fntalaocheq generated by hbm2java
 */
@Entity
@Table(name = "FNTALAOCHEQ")
public class Fntalaocheq implements java.io.Serializable {

	private FntalaocheqId id;
	private Date dttalao;
	private int cheqinitalao;
	private int cheqfimtalao;
	private int cheqatualtalao;
	private char ativotalao;
	private Date dtins;
	private Date hins;
	private String idusuins;
	private Date dtalt;
	private Date halt;
	private String idusualt;
	private Set fntipocobs = new HashSet(0);

	public Fntalaocheq() {
	}

	public Fntalaocheq(FntalaocheqId id, Date dttalao, int cheqinitalao,
			int cheqfimtalao, int cheqatualtalao, char ativotalao, Date dtins,
			Date hins, String idusuins, Date dtalt, Date halt, String idusualt) {
		this.id = id;
		this.dttalao = dttalao;
		this.cheqinitalao = cheqinitalao;
		this.cheqfimtalao = cheqfimtalao;
		this.cheqatualtalao = cheqatualtalao;
		this.ativotalao = ativotalao;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
		this.dtalt = dtalt;
		this.halt = halt;
		this.idusualt = idusualt;
	}

	public Fntalaocheq(FntalaocheqId id, Date dttalao, int cheqinitalao,
			int cheqfimtalao, int cheqatualtalao, char ativotalao, Date dtins,
			Date hins, String idusuins, Date dtalt, Date halt, String idusualt,
			Set fntipocobs) {
		this.id = id;
		this.dttalao = dttalao;
		this.cheqinitalao = cheqinitalao;
		this.cheqfimtalao = cheqfimtalao;
		this.cheqatualtalao = cheqatualtalao;
		this.ativotalao = ativotalao;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
		this.dtalt = dtalt;
		this.halt = halt;
		this.idusualt = idusualt;
		this.fntipocobs = fntipocobs;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "numconta", column = @Column(name = "NUMCONTA", nullable = false, length = 10)),
			@AttributeOverride(name = "seqtalao", column = @Column(name = "SEQTALAO", nullable = false)),
			@AttributeOverride(name = "codfilial", column = @Column(name = "CODFILIAL", nullable = false)),
			@AttributeOverride(name = "codemp", column = @Column(name = "CODEMP", nullable = false)) })
	public FntalaocheqId getId() {
		return this.id;
	}

	public void setId(FntalaocheqId id) {
		this.id = id;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTTALAO", nullable = false, length = 10)
	public Date getDttalao() {
		return this.dttalao;
	}

	public void setDttalao(Date dttalao) {
		this.dttalao = dttalao;
	}

	@Column(name = "CHEQINITALAO", nullable = false)
	public int getCheqinitalao() {
		return this.cheqinitalao;
	}

	public void setCheqinitalao(int cheqinitalao) {
		this.cheqinitalao = cheqinitalao;
	}

	@Column(name = "CHEQFIMTALAO", nullable = false)
	public int getCheqfimtalao() {
		return this.cheqfimtalao;
	}

	public void setCheqfimtalao(int cheqfimtalao) {
		this.cheqfimtalao = cheqfimtalao;
	}

	@Column(name = "CHEQATUALTALAO", nullable = false)
	public int getCheqatualtalao() {
		return this.cheqatualtalao;
	}

	public void setCheqatualtalao(int cheqatualtalao) {
		this.cheqatualtalao = cheqatualtalao;
	}

	@Column(name = "ATIVOTALAO", nullable = false, length = 1)
	public char getAtivotalao() {
		return this.ativotalao;
	}

	public void setAtivotalao(char ativotalao) {
		this.ativotalao = ativotalao;
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

	@Column(name = "IDUSUINS", nullable = false, length = 128)
	public String getIdusuins() {
		return this.idusuins;
	}

	public void setIdusuins(String idusuins) {
		this.idusuins = idusuins;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTALT", nullable = false, length = 10)
	public Date getDtalt() {
		return this.dtalt;
	}

	public void setDtalt(Date dtalt) {
		this.dtalt = dtalt;
	}

	@Temporal(TemporalType.TIME)
	@Column(name = "HALT", nullable = false, length = 8)
	public Date getHalt() {
		return this.halt;
	}

	public void setHalt(Date halt) {
		this.halt = halt;
	}

	@Column(name = "IDUSUALT", nullable = false, length = 128)
	public String getIdusualt() {
		return this.idusualt;
	}

	public void setIdusualt(String idusualt) {
		this.idusualt = idusualt;
	}

/*	@OneToMany(fetch = FetchType.LAZY, mappedBy = "fntalaocheq")
	public Set getFntipocobs() {
		return this.fntipocobs;
	}

	public void setFntipocobs(Set fntipocobs) {
		this.fntipocobs = fntipocobs;
	}
*/
}
