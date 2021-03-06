package org.freedom.persist.entity;

// Generated 12/05/2014 09:11:34 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SgacessoeuId generated by hbm2java
 */
@Embeddable
public class SgacessoeuId implements java.io.Serializable {

	private short codfilialfl;
	private int codempfl;
	private String idusu;
	private int codemp;
	private short codfilial;

	public SgacessoeuId() {
	}

	public SgacessoeuId(short codfilialfl, int codempfl, String idusu,
			int codemp, short codfilial) {
		this.codfilialfl = codfilialfl;
		this.codempfl = codempfl;
		this.idusu = idusu;
		this.codemp = codemp;
		this.codfilial = codfilial;
	}

	@Column(name = "CODFILIALFL", nullable = false)
	public short getCodfilialfl() {
		return this.codfilialfl;
	}

	public void setCodfilialfl(short codfilialfl) {
		this.codfilialfl = codfilialfl;
	}

	@Column(name = "CODEMPFL", nullable = false)
	public int getCodempfl() {
		return this.codempfl;
	}

	public void setCodempfl(int codempfl) {
		this.codempfl = codempfl;
	}

	@Column(name = "IDUSU", nullable = false, length = 8)
	public String getIdusu() {
		return this.idusu;
	}

	public void setIdusu(String idusu) {
		this.idusu = idusu;
	}

	@Column(name = "CODEMP", nullable = false)
	public int getCodemp() {
		return this.codemp;
	}

	public void setCodemp(int codemp) {
		this.codemp = codemp;
	}

	@Column(name = "CODFILIAL", nullable = false)
	public short getCodfilial() {
		return this.codfilial;
	}

	public void setCodfilial(short codfilial) {
		this.codfilial = codfilial;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SgacessoeuId))
			return false;
		SgacessoeuId castOther = (SgacessoeuId) other;

		return (this.getCodfilialfl() == castOther.getCodfilialfl())
				&& (this.getCodempfl() == castOther.getCodempfl())
				&& ((this.getIdusu() == castOther.getIdusu()) || (this
						.getIdusu() != null && castOther.getIdusu() != null && this
						.getIdusu().equals(castOther.getIdusu())))
				&& (this.getCodemp() == castOther.getCodemp())
				&& (this.getCodfilial() == castOther.getCodfilial());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getCodfilialfl();
		result = 37 * result + this.getCodempfl();
		result = 37 * result
				+ (getIdusu() == null ? 0 : this.getIdusu().hashCode());
		result = 37 * result + this.getCodemp();
		result = 37 * result + this.getCodfilial();
		return result;
	}

}
