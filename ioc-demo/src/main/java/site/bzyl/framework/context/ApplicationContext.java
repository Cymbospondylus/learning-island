package site.bzyl.framework.context;

import site.bzyl.framework.beans.factory.BeanFactory;

public interface ApplicationContext extends BeanFactory {
    void refresh() throws Exception;
}
