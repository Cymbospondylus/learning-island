package site.bzyl.framework.beans;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MutablePropertyValues implements Iterable<PropertyValue>{
    private final List<PropertyValue> propertyValueList;

    public MutablePropertyValues() {
        propertyValueList = new ArrayList<>();
    }

    public MutablePropertyValues(List<PropertyValue> propertyValueList) {
        this.propertyValueList = propertyValueList;
    }

    @Override
    public Iterator<PropertyValue> iterator() {
        return propertyValueList.iterator();
    }

    public PropertyValue[] getPropertyValues() {
        return propertyValueList.toArray(new PropertyValue[0]);
    }

    public PropertyValue getPropertyValue(String propertyName) {
        for (PropertyValue propertyValue : propertyValueList) {
            if (propertyValue.getName().equals(propertyName)) {
                return propertyValue;
            }
        }
        return null;
    }

    public boolean isEmpty() {
        return propertyValueList.isEmpty();
    }

    public MutablePropertyValues addPropertyValue(PropertyValue propertyValue) {
        for (int i = 0; i < propertyValueList.size(); i++) {
            PropertyValue currentPropertyValue = propertyValueList.get(i);
            if (currentPropertyValue.getName().equals(propertyValue.getName())) {
                setPropertyValueAt(propertyValue, i);
                return this;
            }
        }
        propertyValueList.add(propertyValue);
        return this;
    }

    public boolean contains(String propertyName) {
        return getPropertyValue(propertyName) != null;
    }

    private void setPropertyValueAt(PropertyValue propertyValue, int i) {
        propertyValueList.set(i, propertyValue);
    }

}
