/**
 * generated by Xtext 2.17.0
 */
package org.xtext.example.mydsl.validation;

import com.google.common.base.Objects;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.Check;
import org.xtext.example.mydsl.myDsl.Entity;
import org.xtext.example.mydsl.myDsl.Feature;
import org.xtext.example.mydsl.myDsl.MyDslPackage;
import org.xtext.example.mydsl.validation.AbstractMyDslValidator;

/**
 * This class contains custom validation rules.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
@SuppressWarnings("all")
public class MyDslValidator extends AbstractMyDslValidator {
  @Check
  public void checkNamesStartWithCapital(final Entity entity) {
    boolean _isUpperCase = Character.isUpperCase(entity.getName().charAt(0));
    boolean _not = (!_isUpperCase);
    if (_not) {
      this.warning("Name should start with a capital", 
        MyDslPackage.Literals.TYPE__NAME);
    }
  }
  
  @Check
  public void checkFeatureNameIsUnique(final Feature f) {
    EObject _eContainer = f.eContainer();
    Entity superEntity = ((Entity) _eContainer).getSuperType();
    while ((superEntity != null)) {
      {
        EList<Feature> _features = superEntity.getFeatures();
        for (final Feature other : _features) {
          String _name = f.getName();
          String _name_1 = other.getName();
          boolean _equals = Objects.equal(_name, _name_1);
          if (_equals) {
            this.error("Feature names have to be unique", 
              MyDslPackage.Literals.FEATURE__NAME);
            return;
          }
        }
        superEntity = superEntity.getSuperType();
      }
    }
  }
}
