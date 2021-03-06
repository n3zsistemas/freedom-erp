package org.freedom.persist.entity;

// Generated 12/05/2014 09:11:34 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Fnrestricao generated by hbm2java
 */
@Entity
@Table(name = "FNRESTRICAO")
public class Fnrestricao implements java.io.Serializable {

	private FnrestricaoId id;
	private Vdcliente vdcliente;
	private Fntiporestr fntiporestr;
	private int codemptr;
	private short codfilialtr;
	private char sitrestr;
	private Date dtrestr;
	private String obsrestr;
	private Date dtcancrestr;
	private Date dtins;
	private Date hins;
	private String idusuins;
	private Date dtalt;
	private Date halt;
	private String idusualt;

	public Fnrestricao() {
	}

	public Fnrestricao(FnrestricaoId id, Vdcliente vdcliente,
			Fntiporestr fntiporestr, int codemptr, short codfilialtr,
			char sitrestr, Date dtrestr, Date dtins, Date hins, String idusuins) {
		this.id = id;
		this.vdcliente = vdcliente;
		this.fntiporestr = fntiporestr;
		this.codemptr = codemptr;
		this.codfilialtr = codfilialtr;
		this.sitrestr = sitrestr;
		this.dtrestr = dtrestr;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
	}

	public Fnrestricao(FnrestricaoId id, Vdcliente vdcliente,
			Fntiporestr fntiporestr, int codemptr, short codfilialtr,
			char sitrestr, Date dtrestr, String obsrestr, Date dtcancrestr,
			Date dtins, Date hins, String idusuins, Date dtalt, Date halt,
			String idusualt) {
		this.id = id;
		this.vdcliente = vdcliente;
		this.fntiporestr = fntiporestr;
		this.codemptr = codemptr;
		this.codfilialtr = codfilialtr;
		this.sitrestr = sitrestr;
		this.dtrestr = dtrestr;
		this.obsrestr = obsrestr;
		this.dtcancrestr = dtcancrestr;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
		this.dtalt = dtalt;
		this.halt = halt;
		this.idusualt = idusualt;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "codcli", column = @Column(name = "CODCLI", nullable = false)),
			@AttributeOverride(name = "seqrestr", column = @Column(name = "SEQRESTR", nullable = false)),
			@AttributeOverride(name = "codfilial", column = @Column(name = "CODFILIAL", nullable = false)),
			@AttributeOverride(name = "codemp", column = @Column(name = "CODEMP", nullable = false)) })
	public FnrestricaoId getId() {
		return this.id;
	}

	public void setId(FnrestricaoId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODCLI", referencedColumnName = "CODCLI", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODFILIAL", referencedColumnName = "CODFILIAL", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODEMP", referencedColumnName = "CODEMP", nullable = false, insertable = false, updatable = false) })
	public Vdcliente getVdcliente() {
		return this.vdcliente;
	}

	public void setVdcliente(Vdcliente vdcliente) {
		this.vdcliente = vdcliente;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODTPRESTR", referencedColumnName = "CODTPRESTR", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODFILIAL", referencedColumnName = "CODFILIAL", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODEMP", referencedColumnName = "CODEMP", nullable = false, insertable = false, updatable = false) })
	public Fntiporestr getFntiporestr() {
		return this.fntiporestr;
	}

	public void setFntiporestr(Fntiporestr fntiporestr) {
		this.fntiporestr = fntiporestr;
	}

	@Column(name = "CODEMPTR", nullable = false)
	public int getCodemptr() {
		return this.codemptr;
	}

	public void setCodemptr(int codemptr) {
		this.codemptr = codemptr;
	}

	@Column(name = "CODFILIALTR", nullable = false)
	public short getCodfilialtr() {
		return this.codfilialtr;
	}

	public void setCodfilialtr(short codfilialtr) {
		this.codfilialtr = codfilialtr;
	}

	@Column(name = "SITRESTR", nullable = false, length = 1)
	public char getSitrestr() {
		return this.sitrestr;
	}

	public void setSitrestr(char sitrestr) {
		this.sitrestr = sitrestr;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTRESTR", nullable = false, length = 10)
	public Date getDtrestr() {
		return this.dtrestr;
	}

	public void setDtrestr(Date dtrestr) {
		this.dtrestr = dtrestr;
	}

	@Column(name = "OBSRESTR", length = 512)
	public String getObsrestr() {
		return this.obsrestr;
	}

	public void setObsrestr(String obsrestr) {
		this.obsrestr = obsrestr;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DTCANCRESTR", length = 10)
	public Date getDtcancrestr() {
		return this.dtcancrestr;
	}

	public void setDtcancrestr(Date dtcancrestr) {
		this.dtcancrestr = dtcancrestr;
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

	@Column(name = "IDUSUALT", length = 128)
	public String getIdusualt() {
		return this.idusualt;
	}

	public void setIdusualt(String idusualt) {
		this.idusualt = idusualt;
	}

}
