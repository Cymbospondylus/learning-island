package site.bzyl.framework.context.supoort;

import site.bzyl.framework.beans.factory.support.BeanDefinitionReader;
import site.bzyl.framework.beans.factory.support.BeanDefinitionRegistry;
import site.bzyl.framework.context.ApplicationContext;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public abstract class AbstractApplicationContext implements ApplicationContext {
    protected BeanDefinitionReader beanDefinitionReader;
    // 存储 bean 对象的 IOC 容器, key:bean的id值，value:bean对象
    protected Map<String, Object> singletonObjects = new ConcurrentHashMap<>();
    // 配置文件路径
    protected String configLocation;

    @Override
    public void refresh() throws Exception {
        // 加载 BeanDefinition
        beanDefinitionReader.loadBeanDefinitions(configLocation);

        // 初始化 bean
        finishBeanInitialization();
    }

    private void finishBeanInitialization() throws Exception {
        BeanDefinitionRegistry registry = beanDefinitionReader.getRegistry();
        String[] beanNames = registry.getBeanDefinitionNames();
        for (String beanName : beanNames) {
            getBean(beanName);
        }
    }
}
