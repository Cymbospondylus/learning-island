package site.bzyl.bitstore.configuration.property;

/**
 * @version 3.3.0
 * @description: The type Cookie config.


 */
public class CookieConfig {

    /**
     * Gets name.
     *
     * @return the name
     */
    public static String getName() {
        return "bzyl";
    }

    /**
     * Gets interval.
     *
     * @return the interval
     */
    public static Integer getInterval() {
        return 30 * 24 * 60 * 60;
    }
}
