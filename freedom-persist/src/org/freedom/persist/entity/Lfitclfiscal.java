package org.freedom.persist.entity;

// Generated 12/05/2014 09:11:34 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Lfitclfiscal generated by hbm2java
 */
@Entity
@Table(name = "LFITCLFISCAL")
public class Lfitclfiscal implements java.io.Serializable {

	private LfitclfiscalId id;
	private Lfsittrib lfsittribByLfitclsfiscalfklfsittribpis;
	private Lfmensagem lfmensagem;
	private Lfcalccusto lfcalccusto;
	private Lfregrafiscal lfregrafiscal;
	private Lfsittrib lfsittribByLfitclsfiscalfklfsittribiss;
	private Lfsittrib lfsittribByLfitclsfiscalfklfsittribcof;
	private Lfclfiscal lfclfiscal;
	private Lftipofisccli lftipofisccli;
	private Lftrattrib lftrattrib;
	private Eqtipomov eqtipomov;
	private Lfcsosn lfcsosn;
	private Lfsittrib lfsittribByLfitclsfiscalfklfsittribipi;
	private Sguf sguf;
	private char origfisc;
	private String tipofisc;
	private char tpredicmsfisc;
	private char ativoitfisc;
	private BigDecimal redfisc;
	private char noufitfisc;
	private BigDecimal aliqfisc;
	private BigDecimal aliqfiscintra;
	private BigDecimal aliqlfisc;
	private BigDecimal aliqipifisc;
	private BigDecimal aliqpisfisc;
	private BigDecimal aliqcofinsfisc;
	private BigDecimal aliqcsocialfisc;
	private BigDecimal aliqirfisc;
	private BigDecimal aliqfunruralfisc;
	private BigDecimal aliqiifisc;
	private String tipost;
	private BigDecimal margemvlagr;
	private char geralfisc;
	private Character tpcalcipi;
	private BigDecimal vlripiunidtrib;
	private short modbcicms;
	private short modbcicmsst;
	private BigDecimal vlrpisunidtrib;
	private BigDecimal vlrcofunidtrib;
	private String tipousoitfisc;
	private Character redbasest;
	private Character redbasefrete;
	private BigDecimal aliqissfisc;
	private Character retensaoiss;
	private Character indapuripi;
	private BigDecimal aliqicmsimp;
	private BigDecimal perccredpresimp;
	private char adicipibaseicms;
	private char adicicmstotnota;
	private BigDecimal aliqicmsstcm;
	private Character calcstcm;
	private Date dtins;
	private Date hins;
	private String idusuins;
	private Date dtalt;
	private Date halt;
	private String idusualt;
	private Set vditvendas = new HashSet(0);
	private Set cpitimportacaos = new HashSet(0);
	private Set cpitcompras = new HashSet(0);

	public Lfitclfiscal() {
	}

	public Lfitclfiscal(LfitclfiscalId id, Lfclfiscal lfclfiscal,
			Lftrattrib lftrattrib, char origfisc, String tipofisc,
			char tpredicmsfisc, char ativoitfisc, char noufitfisc,
			BigDecimal aliqipifisc, BigDecimal aliqpisfisc,
			BigDecimal aliqcofinsfisc, BigDecimal aliqcsocialfisc,
			BigDecimal aliqirfisc, BigDecimal aliqfunruralfisc,
			BigDecimal aliqiifisc, char geralfisc, short modbcicms,
			short modbcicmsst, String tipousoitfisc,
			BigDecimal perccredpresimp, char adicipibaseicms,
			char adicicmstotnota, Date dtins, Date hins, String idusuins) {
		this.id = id;
		this.lfclfiscal = lfclfiscal;
		this.lftrattrib = lftrattrib;
		this.origfisc = origfisc;
		this.tipofisc = tipofisc;
		this.tpredicmsfisc = tpredicmsfisc;
		this.ativoitfisc = ativoitfisc;
		this.noufitfisc = noufitfisc;
		this.aliqipifisc = aliqipifisc;
		this.aliqpisfisc = aliqpisfisc;
		this.aliqcofinsfisc = aliqcofinsfisc;
		this.aliqcsocialfisc = aliqcsocialfisc;
		this.aliqirfisc = aliqirfisc;
		this.aliqfunruralfisc = aliqfunruralfisc;
		this.aliqiifisc = aliqiifisc;
		this.geralfisc = geralfisc;
		this.modbcicms = modbcicms;
		this.modbcicmsst = modbcicmsst;
		this.tipousoitfisc = tipousoitfisc;
		this.perccredpresimp = perccredpresimp;
		this.adicipibaseicms = adicipibaseicms;
		this.adicicmstotnota = adicicmstotnota;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
	}

	public Lfitclfiscal(LfitclfiscalId id,
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribpis,
			Lfmensagem lfmensagem, Lfcalccusto lfcalccusto,
			Lfregrafiscal lfregrafiscal,
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribiss,
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribcof,
			Lfclfiscal lfclfiscal, Lftipofisccli lftipofisccli,
			Lftrattrib lftrattrib, Eqtipomov eqtipomov, Lfcsosn lfcsosn,
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribipi, Sguf sguf,
			char origfisc, String tipofisc, char tpredicmsfisc,
			char ativoitfisc, BigDecimal redfisc, char noufitfisc,
			BigDecimal aliqfisc, BigDecimal aliqfiscintra,
			BigDecimal aliqlfisc, BigDecimal aliqipifisc,
			BigDecimal aliqpisfisc, BigDecimal aliqcofinsfisc,
			BigDecimal aliqcsocialfisc, BigDecimal aliqirfisc,
			BigDecimal aliqfunruralfisc, BigDecimal aliqiifisc, String tipost,
			BigDecimal margemvlagr, char geralfisc, Character tpcalcipi,
			BigDecimal vlripiunidtrib, short modbcicms, short modbcicmsst,
			BigDecimal vlrpisunidtrib, BigDecimal vlrcofunidtrib,
			String tipousoitfisc, Character redbasest, Character redbasefrete,
			BigDecimal aliqissfisc, Character retensaoiss,
			Character indapuripi, BigDecimal aliqicmsimp,
			BigDecimal perccredpresimp, char adicipibaseicms,
			char adicicmstotnota, BigDecimal aliqicmsstcm, Character calcstcm,
			Date dtins, Date hins, String idusuins, Date dtalt, Date halt,
			String idusualt, Set vditvendas, Set cpitimportacaos,
			Set cpitcompras) {
		this.id = id;
		this.lfsittribByLfitclsfiscalfklfsittribpis = lfsittribByLfitclsfiscalfklfsittribpis;
		this.lfmensagem = lfmensagem;
		this.lfcalccusto = lfcalccusto;
		this.lfregrafiscal = lfregrafiscal;
		this.lfsittribByLfitclsfiscalfklfsittribiss = lfsittribByLfitclsfiscalfklfsittribiss;
		this.lfsittribByLfitclsfiscalfklfsittribcof = lfsittribByLfitclsfiscalfklfsittribcof;
		this.lfclfiscal = lfclfiscal;
		this.lftipofisccli = lftipofisccli;
		this.lftrattrib = lftrattrib;
		this.eqtipomov = eqtipomov;
		this.lfcsosn = lfcsosn;
		this.lfsittribByLfitclsfiscalfklfsittribipi = lfsittribByLfitclsfiscalfklfsittribipi;
		this.sguf = sguf;
		this.origfisc = origfisc;
		this.tipofisc = tipofisc;
		this.tpredicmsfisc = tpredicmsfisc;
		this.ativoitfisc = ativoitfisc;
		this.redfisc = redfisc;
		this.noufitfisc = noufitfisc;
		this.aliqfisc = aliqfisc;
		this.aliqfiscintra = aliqfiscintra;
		this.aliqlfisc = aliqlfisc;
		this.aliqipifisc = aliqipifisc;
		this.aliqpisfisc = aliqpisfisc;
		this.aliqcofinsfisc = aliqcofinsfisc;
		this.aliqcsocialfisc = aliqcsocialfisc;
		this.aliqirfisc = aliqirfisc;
		this.aliqfunruralfisc = aliqfunruralfisc;
		this.aliqiifisc = aliqiifisc;
		this.tipost = tipost;
		this.margemvlagr = margemvlagr;
		this.geralfisc = geralfisc;
		this.tpcalcipi = tpcalcipi;
		this.vlripiunidtrib = vlripiunidtrib;
		this.modbcicms = modbcicms;
		this.modbcicmsst = modbcicmsst;
		this.vlrpisunidtrib = vlrpisunidtrib;
		this.vlrcofunidtrib = vlrcofunidtrib;
		this.tipousoitfisc = tipousoitfisc;
		this.redbasest = redbasest;
		this.redbasefrete = redbasefrete;
		this.aliqissfisc = aliqissfisc;
		this.retensaoiss = retensaoiss;
		this.indapuripi = indapuripi;
		this.aliqicmsimp = aliqicmsimp;
		this.perccredpresimp = perccredpresimp;
		this.adicipibaseicms = adicipibaseicms;
		this.adicicmstotnota = adicicmstotnota;
		this.aliqicmsstcm = aliqicmsstcm;
		this.calcstcm = calcstcm;
		this.dtins = dtins;
		this.hins = hins;
		this.idusuins = idusuins;
		this.dtalt = dtalt;
		this.halt = halt;
		this.idusualt = idusualt;
		this.vditvendas = vditvendas;
		this.cpitimportacaos = cpitimportacaos;
		this.cpitcompras = cpitcompras;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "codemp", column = @Column(name = "CODEMP", nullable = false)),
			@AttributeOverride(name = "codfilial", column = @Column(name = "CODFILIAL", nullable = false)),
			@AttributeOverride(name = "codfisc", column = @Column(name = "CODFISC", nullable = false, length = 13)),
			@AttributeOverride(name = "coditfisc", column = @Column(name = "CODITFISC", nullable = false)) })
	public LfitclfiscalId getId() {
		return this.id;
	}

	public void setId(LfitclfiscalId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODSITTRIBPIS", referencedColumnName = "CODSITTRIB"),
			@JoinColumn(name = "IMPSITTRIBPIS", referencedColumnName = "IMPSITTRIB"),
			@JoinColumn(name = "CODFILIALSP", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPSP", referencedColumnName = "CODEMP") })
	public Lfsittrib getLfsittribByLfitclsfiscalfklfsittribpis() {
		return this.lfsittribByLfitclsfiscalfklfsittribpis;
	}

	public void setLfsittribByLfitclsfiscalfklfsittribpis(
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribpis) {
		this.lfsittribByLfitclsfiscalfklfsittribpis = lfsittribByLfitclsfiscalfklfsittribpis;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODMENS", referencedColumnName = "CODMENS"),
			@JoinColumn(name = "CODFILIALME", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPME", referencedColumnName = "CODEMP") })
	public Lfmensagem getLfmensagem() {
		return this.lfmensagem;
	}

	public void setLfmensagem(Lfmensagem lfmensagem) {
		this.lfmensagem = lfmensagem;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODCALC", referencedColumnName = "CODCALC"),
			@JoinColumn(name = "CODFILIALCC", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPCC", referencedColumnName = "CODEMP") })
	public Lfcalccusto getLfcalccusto() {
		return this.lfcalccusto;
	}

	public void setLfcalccusto(Lfcalccusto lfcalccusto) {
		this.lfcalccusto = lfcalccusto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODREGRA", referencedColumnName = "CODREGRA"),
			@JoinColumn(name = "CODFILIALRA", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPRA", referencedColumnName = "CODEMP") })
	public Lfregrafiscal getLfregrafiscal() {
		return this.lfregrafiscal;
	}

	public void setLfregrafiscal(Lfregrafiscal lfregrafiscal) {
		this.lfregrafiscal = lfregrafiscal;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODSITTRIBISS", referencedColumnName = "CODSITTRIB"),
			@JoinColumn(name = "IMPSITTRIBISS", referencedColumnName = "IMPSITTRIB"),
			@JoinColumn(name = "CODFILIALIS", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPIS", referencedColumnName = "CODEMP") })
	public Lfsittrib getLfsittribByLfitclsfiscalfklfsittribiss() {
		return this.lfsittribByLfitclsfiscalfklfsittribiss;
	}

	public void setLfsittribByLfitclsfiscalfklfsittribiss(
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribiss) {
		this.lfsittribByLfitclsfiscalfklfsittribiss = lfsittribByLfitclsfiscalfklfsittribiss;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODSITTRIBCOF", referencedColumnName = "CODSITTRIB"),
			@JoinColumn(name = "IMPSITTRIBCOF", referencedColumnName = "IMPSITTRIB"),
			@JoinColumn(name = "CODFILIALSC", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPSC", referencedColumnName = "CODEMP") })
	public Lfsittrib getLfsittribByLfitclsfiscalfklfsittribcof() {
		return this.lfsittribByLfitclsfiscalfklfsittribcof;
	}

	public void setLfsittribByLfitclsfiscalfklfsittribcof(
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribcof) {
		this.lfsittribByLfitclsfiscalfklfsittribcof = lfsittribByLfitclsfiscalfklfsittribcof;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODFISC", referencedColumnName = "CODFISC", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODFILIAL", referencedColumnName = "CODFILIAL", nullable = false, insertable = false, updatable = false),
			@JoinColumn(name = "CODEMP", referencedColumnName = "CODEMP", nullable = false, insertable = false, updatable = false) })
	public Lfclfiscal getLfclfiscal() {
		return this.lfclfiscal;
	}

	public void setLfclfiscal(Lfclfiscal lfclfiscal) {
		this.lfclfiscal = lfclfiscal;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODFISCCLI", referencedColumnName = "CODFISCCLI"),
			@JoinColumn(name = "CODFILIALFC", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPFC", referencedColumnName = "CODEMP") })
	public Lftipofisccli getLftipofisccli() {
		return this.lftipofisccli;
	}

	public void setLftipofisccli(Lftipofisccli lftipofisccli) {
		this.lftipofisccli = lftipofisccli;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODTRATTRIB", referencedColumnName = "CODTRATTRIB", nullable = false),
			@JoinColumn(name = "CODFILIALTT", referencedColumnName = "CODFILIAL", nullable = false),
			@JoinColumn(name = "CODEMPTT", referencedColumnName = "CODEMP", nullable = false) })
	public Lftrattrib getLftrattrib() {
		return this.lftrattrib;
	}

	public void setLftrattrib(Lftrattrib lftrattrib) {
		this.lftrattrib = lftrattrib;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODTIPOMOV", referencedColumnName = "CODTIPOMOV"),
			@JoinColumn(name = "CODFILIALTM", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPTM", referencedColumnName = "CODEMP") })
	public Eqtipomov getEqtipomov() {
		return this.eqtipomov;
	}

	public void setEqtipomov(Eqtipomov eqtipomov) {
		this.eqtipomov = eqtipomov;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CSOSN", referencedColumnName = "CSOSN"),
			@JoinColumn(name = "CODFILIALCN", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPCN", referencedColumnName = "CODEMP") })
	public Lfcsosn getLfcsosn() {
		return this.lfcsosn;
	}

	public void setLfcsosn(Lfcsosn lfcsosn) {
		this.lfcsosn = lfcsosn;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "CODSITTRIBIPI", referencedColumnName = "CODSITTRIB"),
			@JoinColumn(name = "IMPSITTRIBIPI", referencedColumnName = "IMPSITTRIB"),
			@JoinColumn(name = "CODFILIALSI", referencedColumnName = "CODFILIAL"),
			@JoinColumn(name = "CODEMPSI", referencedColumnName = "CODEMP") })
	public Lfsittrib getLfsittribByLfitclsfiscalfklfsittribipi() {
		return this.lfsittribByLfitclsfiscalfklfsittribipi;
	}

	public void setLfsittribByLfitclsfiscalfklfsittribipi(
			Lfsittrib lfsittribByLfitclsfiscalfklfsittribipi) {
		this.lfsittribByLfitclsfiscalfklfsittribipi = lfsittribByLfitclsfiscalfklfsittribipi;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
			@JoinColumn(name = "SIGLAUF", referencedColumnName = "SIGLAUF"),
			@JoinColumn(name = "CODPAIS", referencedColumnName = "CODPAIS") })
	public Sguf getSguf() {
		return this.sguf;
	}

	public void setSguf(Sguf sguf) {
		this.sguf = sguf;
	}

	@Column(name = "ORIGFISC", nullable = false, length = 1)
	public char getOrigfisc() {
		return this.origfisc;
	}

	public void setOrigfisc(char origfisc) {
		this.origfisc = origfisc;
	}

	@Column(name = "TIPOFISC", nullable = false, length = 2)
	public String getTipofisc() {
		return this.tipofisc;
	}

	public void setTipofisc(String tipofisc) {
		this.tipofisc = tipofisc;
	}

	@Column(name = "TPREDICMSFISC", nullable = false, length = 1)
	public char getTpredicmsfisc() {
		return this.tpredicmsfisc;
	}

	public void setTpredicmsfisc(char tpredicmsfisc) {
		this.tpredicmsfisc = tpredicmsfisc;
	}

	@Column(name = "ATIVOITFISC", nullable = false, length = 1)
	public char getAtivoitfisc() {
		return this.ativoitfisc;
	}

	public void setAtivoitfisc(char ativoitfisc) {
		this.ativoitfisc = ativoitfisc;
	}

	@Column(name = "REDFISC", precision = 9)
	public BigDecimal getRedfisc() {
		return this.redfisc;
	}

	public void setRedfisc(BigDecimal redfisc) {
		this.redfisc = redfisc;
	}

	@Column(name = "NOUFITFISC", nullable = false, length = 1)
	public char getNoufitfisc() {
		return this.noufitfisc;
	}

	public void setNoufitfisc(char noufitfisc) {
		this.noufitfisc = noufitfisc;
	}

	@Column(name = "ALIQFISC", precision = 9)
	public BigDecimal getAliqfisc() {
		return this.aliqfisc;
	}

	public void setAliqfisc(BigDecimal aliqfisc) {
		this.aliqfisc = aliqfisc;
	}

	@Column(name = "ALIQFISCINTRA", precision = 9)
	public BigDecimal getAliqfiscintra() {
		return this.aliqfiscintra;
	}

	public void setAliqfiscintra(BigDecimal aliqfiscintra) {
		this.aliqfiscintra = aliqfiscintra;
	}

	@Column(name = "ALIQLFISC", precision = 9)
	public BigDecimal getAliqlfisc() {
		return this.aliqlfisc;
	}

	public void setAliqlfisc(BigDecimal aliqlfisc) {
		this.aliqlfisc = aliqlfisc;
	}

	@Column(name = "ALIQIPIFISC", nullable = false, precision = 6)
	public BigDecimal getAliqipifisc() {
		return this.aliqipifisc;
	}

	public void setAliqipifisc(BigDecimal aliqipifisc) {
		this.aliqipifisc = aliqipifisc;
	}

	@Column(name = "ALIQPISFISC", nullable = false, precision = 6)
	public BigDecimal getAliqpisfisc() {
		return this.aliqpisfisc;
	}

	public void setAliqpisfisc(BigDecimal aliqpisfisc) {
		this.aliqpisfisc = aliqpisfisc;
	}

	@Column(name = "ALIQCOFINSFISC", nullable = false, precision = 6)
	public BigDecimal getAliqcofinsfisc() {
		return this.aliqcofinsfisc;
	}

	public void setAliqcofinsfisc(BigDecimal aliqcofinsfisc) {
		this.aliqcofinsfisc = aliqcofinsfisc;
	}

	@Column(name = "ALIQCSOCIALFISC", nullable = false, precision = 6)
	public BigDecimal getAliqcsocialfisc() {
		return this.aliqcsocialfisc;
	}

	public void setAliqcsocialfisc(BigDecimal aliqcsocialfisc) {
		this.aliqcsocialfisc = aliqcsocialfisc;
	}

	@Column(name = "ALIQIRFISC", nullable = false, precision = 6)
	public BigDecimal getAliqirfisc() {
		return this.aliqirfisc;
	}

	public void setAliqirfisc(BigDecimal aliqirfisc) {
		this.aliqirfisc = aliqirfisc;
	}

	@Column(name = "ALIQFUNRURALFISC", nullable = false, precision = 6)
	public BigDecimal getAliqfunruralfisc() {
		return this.aliqfunruralfisc;
	}

	public void setAliqfunruralfisc(BigDecimal aliqfunruralfisc) {
		this.aliqfunruralfisc = aliqfunruralfisc;
	}

	@Column(name = "ALIQIIFISC", nullable = false, precision = 9)
	public BigDecimal getAliqiifisc() {
		return this.aliqiifisc;
	}

	public void setAliqiifisc(BigDecimal aliqiifisc) {
		this.aliqiifisc = aliqiifisc;
	}

	@Column(name = "TIPOST", length = 2)
	public String getTipost() {
		return this.tipost;
	}

	public void setTipost(String tipost) {
		this.tipost = tipost;
	}

	@Column(name = "MARGEMVLAGR", precision = 15, scale = 5)
	public BigDecimal getMargemvlagr() {
		return this.margemvlagr;
	}

	public void setMargemvlagr(BigDecimal margemvlagr) {
		this.margemvlagr = margemvlagr;
	}

	@Column(name = "GERALFISC", nullable = false, length = 1)
	public char getGeralfisc() {
		return this.geralfisc;
	}

	public void setGeralfisc(char geralfisc) {
		this.geralfisc = geralfisc;
	}

	@Column(name = "TPCALCIPI", length = 1)
	public Character getTpcalcipi() {
		return this.tpcalcipi;
	}

	public void setTpcalcipi(Character tpcalcipi) {
		this.tpcalcipi = tpcalcipi;
	}

	@Column(name = "VLRIPIUNIDTRIB", precision = 15, scale = 5)
	public BigDecimal getVlripiunidtrib() {
		return this.vlripiunidtrib;
	}

	public void setVlripiunidtrib(BigDecimal vlripiunidtrib) {
		this.vlripiunidtrib = vlripiunidtrib;
	}

	@Column(name = "MODBCICMS", nullable = false)
	public short getModbcicms() {
		return this.modbcicms;
	}

	public void setModbcicms(short modbcicms) {
		this.modbcicms = modbcicms;
	}

	@Column(name = "MODBCICMSST", nullable = false)
	public short getModbcicmsst() {
		return this.modbcicmsst;
	}

	public void setModbcicmsst(short modbcicmsst) {
		this.modbcicmsst = modbcicmsst;
	}

	@Column(name = "VLRPISUNIDTRIB", precision = 15, scale = 5)
	public BigDecimal getVlrpisunidtrib() {
		return this.vlrpisunidtrib;
	}

	public void setVlrpisunidtrib(BigDecimal vlrpisunidtrib) {
		this.vlrpisunidtrib = vlrpisunidtrib;
	}

	@Column(name = "VLRCOFUNIDTRIB", precision = 15, scale = 5)
	public BigDecimal getVlrcofunidtrib() {
		return this.vlrcofunidtrib;
	}

	public void setVlrcofunidtrib(BigDecimal vlrcofunidtrib) {
		this.vlrcofunidtrib = vlrcofunidtrib;
	}

	@Column(name = "TIPOUSOITFISC", nullable = false, length = 2)
	public String getTipousoitfisc() {
		return this.tipousoitfisc;
	}

	public void setTipousoitfisc(String tipousoitfisc) {
		this.tipousoitfisc = tipousoitfisc;
	}

	@Column(name = "REDBASEST", length = 1)
	public Character getRedbasest() {
		return this.redbasest;
	}

	public void setRedbasest(Character redbasest) {
		this.redbasest = redbasest;
	}

	@Column(name = "REDBASEFRETE", length = 1)
	public Character getRedbasefrete() {
		return this.redbasefrete;
	}

	public void setRedbasefrete(Character redbasefrete) {
		this.redbasefrete = redbasefrete;
	}

	@Column(name = "ALIQISSFISC", precision = 6)
	public BigDecimal getAliqissfisc() {
		return this.aliqissfisc;
	}

	public void setAliqissfisc(BigDecimal aliqissfisc) {
		this.aliqissfisc = aliqissfisc;
	}

	@Column(name = "RETENSAOISS", length = 1)
	public Character getRetensaoiss() {
		return this.retensaoiss;
	}

	public void setRetensaoiss(Character retensaoiss) {
		this.retensaoiss = retensaoiss;
	}

	@Column(name = "INDAPURIPI", length = 1)
	public Character getIndapuripi() {
		return this.indapuripi;
	}

	public void setIndapuripi(Character indapuripi) {
		this.indapuripi = indapuripi;
	}

	@Column(name = "ALIQICMSIMP", precision = 15, scale = 5)
	public BigDecimal getAliqicmsimp() {
		return this.aliqicmsimp;
	}

	public void setAliqicmsimp(BigDecimal aliqicmsimp) {
		this.aliqicmsimp = aliqicmsimp;
	}

	@Column(name = "PERCCREDPRESIMP", nullable = false, precision = 15, scale = 5)
	public BigDecimal getPerccredpresimp() {
		return this.perccredpresimp;
	}

	public void setPerccredpresimp(BigDecimal perccredpresimp) {
		this.perccredpresimp = perccredpresimp;
	}

	@Column(name = "ADICIPIBASEICMS", nullable = false, length = 1)
	public char getAdicipibaseicms() {
		return this.adicipibaseicms;
	}

	public void setAdicipibaseicms(char adicipibaseicms) {
		this.adicipibaseicms = adicipibaseicms;
	}

	@Column(name = "ADICICMSTOTNOTA", nullable = false, length = 1)
	public char getAdicicmstotnota() {
		return this.adicicmstotnota;
	}

	public void setAdicicmstotnota(char adicicmstotnota) {
		this.adicicmstotnota = adicicmstotnota;
	}

	@Column(name = "ALIQICMSSTCM", precision = 9)
	public BigDecimal getAliqicmsstcm() {
		return this.aliqicmsstcm;
	}

	public void setAliqicmsstcm(BigDecimal aliqicmsstcm) {
		this.aliqicmsstcm = aliqicmsstcm;
	}

	@Column(name = "CALCSTCM", length = 1)
	public Character getCalcstcm() {
		return this.calcstcm;
	}

	public void setCalcstcm(Character calcstcm) {
		this.calcstcm = calcstcm;
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

	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "lfitclfiscal")
	public Set getVditvendas() {
		return this.vditvendas;
	}

	public void setVditvendas(Set vditvendas) {
		this.vditvendas = vditvendas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "lfitclfiscal")
	public Set getCpitimportacaos() {
		return this.cpitimportacaos;
	}

	public void setCpitimportacaos(Set cpitimportacaos) {
		this.cpitimportacaos = cpitimportacaos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "lfitclfiscal")
	public Set getCpitcompras() {
		return this.cpitcompras;
	}

	public void setCpitcompras(Set cpitcompras) {
		this.cpitcompras = cpitcompras;
	}
*/
}
