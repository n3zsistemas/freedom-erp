/**
 * @version 02/11/2003 <BR>
 * @author Setpoint Inform�tica Ltda./Fernando Oliveira da Silva <BR>
 * 
 *         Projeto: Freedom <BR>
 * 
 *         Pacote: org.freedom.modulos.std <BR>
 *         Classe: @(#)FUnidade.java <BR>
 * 
 *         Este arquivo � parte do sistema Freedom-ERP, o Freedom-ERP � um software livre; voc� pode redistribui-lo e/ou <BR>
 *         modifica-lo dentro dos termos da Licen�a P�blica Geral GNU como publicada pela Funda��o do Software Livre (FSF); <BR>
 *         na vers�o 2 da Licen�a, ou (na sua opni�o) qualquer vers�o. <BR>
 *         Este programa � distribuido na esperan�a que possa ser util, mas SEM NENHUMA GARANTIA; <BR>
 *         sem uma garantia implicita de ADEQUA��O a qualquer MERCADO ou APLICA��O EM PARTICULAR. <BR>
 *         Veja a Licen�a P�blica Geral GNU para maiores detalhes. <BR>
 *         Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU junto com este programa, se n�o, <BR>
 *         escreva para a Funda��o do Software Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA <BR>
 * <BR>
 * 
 *         Coment�rios sobre a classe...
 * 
 */

package org.freedom.modulos.std.view.frame.crud.plain;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.freedom.infra.functions.StringFunctions;
import org.freedom.library.component.ImprimeOS;
import org.freedom.library.functions.Funcoes;
import org.freedom.library.persistence.ListaCampos;
import org.freedom.library.swing.component.JCheckBoxPad;
import org.freedom.library.swing.component.JTextFieldPad;
import org.freedom.library.swing.frame.Aplicativo;
import org.freedom.library.swing.frame.FDados;
import org.freedom.library.type.TYPE_PRINT;
import org.freedom.modulos.std.view.dialog.report.DLRUnidade;

public class FUnidade extends FDados implements ActionListener {

	private static final long serialVersionUID = 1L;

	private JTextFieldPad txtCodUnidade = new JTextFieldPad( JTextFieldPad.TP_STRING, 20, 0 );

	private JTextFieldPad txtDescUnidade = new JTextFieldPad( JTextFieldPad.TP_STRING, 60, 0 );

	private JTextFieldPad txtCasasDec = new JTextFieldPad( JTextFieldPad.TP_INTEGER, 5, 0 );
	
	private JCheckBoxPad cbCalcVolEmb = new JCheckBoxPad( "Calcula volumes p/embalagem", "S", "N" );

	public FUnidade() {

		super();
		setTitulo( "Cadastro de Unidades" );
		setAtribos( 50, 50, 450, 160 );
		adicCampo( txtCodUnidade, 7, 20, 110, 20, "CodUnid", "C�d.unid.", ListaCampos.DB_PK, true );
		adicCampo( txtDescUnidade, 120, 20, 300, 20, "DescUnid", "Descri��o da unidade", ListaCampos.DB_SI, true );
		adicCampo( txtCasasDec, 7, 60, 110, 20, "CasasDec", "Casas decimais", ListaCampos.DB_SI, true );
		
		adicDB( cbCalcVolEmb, 120, 60, 300, 20, "calcvolemb", "", false );
		
		setListaCampos( true, "UNIDADE", "EQ" );
		btImp.addActionListener( this );
		btPrevimp.addActionListener( this );
		lcCampos.setQueryInsert( false );
		setImprimir( true );
	}

	public void actionPerformed( ActionEvent evt ) {

		if ( evt.getSource() == btPrevimp )
			imprimir( TYPE_PRINT.VIEW );
		else if ( evt.getSource() == btImp )
			imprimir( TYPE_PRINT.PRINT);
		super.actionPerformed( evt );
	}

	private void imprimir( TYPE_PRINT bVisualizar ) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String sSQL = null;
		DLRUnidade dl = null;
		ImprimeOS imp = null;
		int linPag = 0;

		dl = new DLRUnidade();
		dl.setVisible( true );

		if ( dl.OK == false ) {
			dl.dispose();
			return;
		}

		try {

			imp = new ImprimeOS( "", con );
			linPag = imp.verifLinPag() - 1;
			imp.montaCab();
			imp.setTitulo( "Relat�rio de Unidades" );
			imp.limpaPags();

			sSQL = "SELECT CODUNID,DESCUNID " + "FROM EQUNIDADE " + "WHERE CODEMP=? AND CODFILIAL=? " + "ORDER BY " + dl.getValor();

			ps = con.prepareStatement( sSQL );
			ps.setInt( 1, Aplicativo.iCodEmp );
			ps.setInt( 2, ListaCampos.getMasterFilial( "EQUNIDADE" ) );
			rs = ps.executeQuery();
			while ( rs.next() ) {
				if ( imp.pRow() == 0 ) {
					imp.impCab( 80, false );
					imp.say( imp.pRow(), 0, imp.normal() );
					imp.say( imp.pRow(), 2, "C�d.unid." );
					imp.say( imp.pRow(), 30, "Descri��o" );
					imp.say( imp.pRow() + 1, 0, imp.normal() );
					imp.say( imp.pRow(), 0, StringFunctions.replicate( "-", 79 ) );
				}
				imp.say( imp.pRow() + 1, 0, imp.normal() );
				imp.say( imp.pRow(), 2, rs.getString( "Codunid" ) );
				imp.say( imp.pRow(), 30, rs.getString( "Descunid" ) );
				if ( imp.pRow() >= linPag ) {
					imp.say( imp.pRow() + 1, 0, imp.normal() );
					imp.say( imp.pRow(), 0, StringFunctions.replicate( "-", 79 ) );
					imp.incPags();
					imp.eject();
				}
			}

			imp.say( imp.pRow() + 1, 0, imp.normal() );
			imp.say( imp.pRow(), 0, StringFunctions.replicate( "=", 79 ) );
			imp.eject();
			imp.fechaGravacao();

			con.commit();
			dl.dispose();
		} catch ( SQLException err ) {
			Funcoes.mensagemErro( this, "Erro na consulta � tabela de UNIDADES!\n" + err.getMessage(), true, con, err );
			err.printStackTrace();
		} finally {
			ps = null;
			rs = null;
			sSQL = null;
			dl = null;
		}

		if ( bVisualizar==TYPE_PRINT.VIEW )
			imp.preview( this );
		else
			imp.print();
	}
}
