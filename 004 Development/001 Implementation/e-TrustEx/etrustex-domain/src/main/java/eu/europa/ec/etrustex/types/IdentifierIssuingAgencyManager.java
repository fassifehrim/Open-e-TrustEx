/**
 * Version: MPL 1.1/EUPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at:
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Copyright The PEPPOL project (http://www.peppol.eu)
 *
 * Alternatively, the contents of this file may be used under the
 * terms of the EUPL, Version 1.1 or - as soon they will be approved
 * by the European Commission - subsequent versions of the EUPL
 * (the "Licence"); You may not use this work except in compliance
 * with the Licence.
 * You may obtain a copy of the Licence at:
 * http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and
 * limitations under the Licence.
 *
 * If you wish to allow use of your version of this file only
 * under the terms of the EUPL License and not to allow others to use
 * your version of this file under the MPL, indicate your decision by
 * deleting the provisions above and replace them with the notice and
 * other provisions required by the EUPL License. If you do not delete
 * the provisions above, a recipient may use your version of this file
 * under either the MPL or the EUPL License.
 */
package eu.europa.ec.etrustex.types;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;


/**
 * This class manages the PEPPOL identifier issuing agencies using the
 * <b>iso6523-actorid-upis</b> scheme.
 * 
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class IdentifierIssuingAgencyManager {
  private static final List <IIdentifierIssuingAgency> s_aCodes = new ArrayList <IIdentifierIssuingAgency> ();

  static {
    // Add all predefined identifier issuing agencies
    for (final IdentifierIssuingAgency eIIA : IdentifierIssuingAgency.values ())
      s_aCodes.add (eIIA);
  }


  private IdentifierIssuingAgencyManager () {}

  /**
   * @return A non-modifiable list of all PEPPOL identifier issuing agencies.
   */
  public static List <? extends IIdentifierIssuingAgency> getAllAgencies () {
    return Collections.unmodifiableList (s_aCodes);
  }

  /**
   * Find the agency with the respective ISO6523 value.
   * 
   * @param sISO6523Code
   *        The value to search. May be <code>null</code>.
   * @return <code>null</code> if no such agency exists.
   */
  public static IIdentifierIssuingAgency getAgencyOfISO6523Code (final String sISO6523Code) {
    if (StringUtils.isNotEmpty(sISO6523Code))
      for (final IIdentifierIssuingAgency aAgency : s_aCodes)
        if (aAgency.getISO6523Code().equalsIgnoreCase (sISO6523Code))
          return aAgency;
    return null;
  }

  /**
   * Check if an agency with the given ISO6523 value exists.
   * 
   * @param sISO6523Code
   *        The value to search. May be <code>null</code>.
   * @return <code>true</code> if such an agency exists, <code>false</code>
   *         otherwise.
   */
  public static boolean containsAgencyWithISO6523Code (final String sISO6523Code) {
    return getAgencyOfISO6523Code (sISO6523Code) != null;
  }

  /**
   * Get the schemeID code of the passed ISO6523 code. If the passed ISO6523
   * code is unknown, <code>null</code> is returned.
   * 
   * @param sISO6523Code
   *        The value to search. May be <code>null</code>.
   * @return The matching schemeID or <code>null</code> if no agency with the
   *         given ISO6523 code exists.
   */
  public static String getSchemeIDOfISO6523Code (final String sISO6523Code) {
    final IIdentifierIssuingAgency aAgency = getAgencyOfISO6523Code (sISO6523Code);
    return aAgency == null ? null : aAgency.getSchemeID ();
  }

  /**
   * Find the agency with the respective schemeID value.
   * 
   * @param sSchemeID
   *        The value to search. May be <code>null</code>.
   * @return <code>null</code> if no such agency exists.
   */
  public static IIdentifierIssuingAgency getAgencyOfSchemeID (final String sSchemeID) {
    if (StringUtils.isNotEmpty(sSchemeID))
      for (final IIdentifierIssuingAgency aAgency : s_aCodes)
        if (aAgency.getSchemeID ().equalsIgnoreCase (sSchemeID))
          return aAgency;
    return null;
  }

  /**
   * Check if an agency with the given schemeID value exists.
   * 
   * @param sSchemeID
   *        The value to search. May be <code>null</code>.
   * @return <code>true</code> if such an agency exists, <code>false</code>
   *         otherwise.
   */
  public static boolean containsAgencyWithSchemeID (final String sSchemeID) {
    return getAgencyOfSchemeID (sSchemeID) != null;
  }

  /**
   * Get the ISO6523 code of the passed schemeID. If the passed schemeID is
   * unknown, <code>null</code> is returned.
   * 
   * @param sSchemeID
   *        The value to search. May be <code>null</code>.
   * @return The matching ISO6523 code or <code>null</code> if no agency with
   *         the given schemeID exists.
   */
  public static String getISO6523CodeOfSchemeID ( final String sSchemeID) {
    final IIdentifierIssuingAgency aAgency = getAgencyOfSchemeID (sSchemeID);
    return aAgency == null ? null : aAgency.getISO6523Code ();
  }


}