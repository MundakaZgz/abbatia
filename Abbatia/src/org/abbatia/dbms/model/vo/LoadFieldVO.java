package org.abbatia.dbms.model.vo;

import java.io.Serializable;

/**
 * <p> T�tulo: LoadFieldVO </p>
 * <p> Descripci�n: </p>
 * <p> Copyright: Copyright (c) 2007 </p>
 * <p> Compa��a: Olympus </p>
 *
 * @author Talarn Consulting
  */
public class LoadFieldVO
  extends FieldVO
  implements Serializable {
  private int     m_iIndice;


  public LoadFieldVO(LoadFieldVO p_oLoadFieldVO, Object p_oValor) {
    super(p_oLoadFieldVO.getNombre(), p_oValor, p_oLoadFieldVO.getTipo());

  }

  /**
   * Crea un nuevo objeto LoadFieldVO.
   */
  public LoadFieldVO() {}


  public int getIndice() {
    return m_iIndice;
  }


  public void setIndice(int p_iIndice) {
    this.m_iIndice = p_iIndice;
  }
}
