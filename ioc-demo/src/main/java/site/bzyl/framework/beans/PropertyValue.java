package site.bzyl.framework.beans;

public class PropertyValue {
    private String name;
    private String ref;
    private String values;

    public PropertyValue() {
    }

    public PropertyValue(String name, String ref, String values) {
        this.name = name;
        this.ref = ref;
        this.values = values;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getValues() {
        return values;
    }

    public void setValues(String values) {
        this.values = values;
    }
}
