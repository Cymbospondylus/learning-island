package site.bzyl.framework.utils;

public class StringUtil {
    private StringUtil() {
        throw new UnsupportedOperationException();
    }

    // 根据字段名获取 setter 方法名, userDao -> setUserDao
    public static String getSetterMethodNameByFieldName(String fieldName) {
        return "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring((1));
    }
}
