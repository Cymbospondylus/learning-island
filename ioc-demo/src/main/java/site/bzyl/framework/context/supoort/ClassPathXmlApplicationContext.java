package site.bzyl.framework.context.supoort;

import org.springframework.util.StringUtils;
import site.bzyl.framework.beans.MutablePropertyValues;
import site.bzyl.framework.beans.PropertyValue;
import site.bzyl.framework.beans.factory.config.BeanDefinition;
import site.bzyl.framework.beans.factory.support.BeanDefinitionRegistry;
import site.bzyl.framework.beans.factory.xml.XmlBeanDefinitionReader;
import site.bzyl.framework.utils.StringUtil;

import java.lang.reflect.Method;
import java.util.Objects;

public class ClassPathXmlApplicationContext extends AbstractApplicationContext{

    public ClassPathXmlApplicationContext(String configLocation) {
        this.configLocation = configLocation;
        // 构建 XmlBeanDefinitionReader 对象
        this.beanDefinitionReader = new XmlBeanDefinitionReader();
        try {
            refresh();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Object getBean(String name) throws Exception {
        // 容器中存在对象直接返回
        Object obj = singletonObjects.get(name);
        if (Objects.nonNull(obj)) {
            return obj;
        }

        BeanDefinitionRegistry registry = beanDefinitionReader.getRegistry();

        // 如果 BeanDefinition 对象未注册到容器中, 则返回空
        BeanDefinition beanDefinition = registry.getBeanDefinition(name);
        if (Objects.isNull(beanDefinition)) {
            return null;
        }

        // 根据 BeanDefinition 反射创建 Bean 对象
        String className = beanDefinition.getClassName();
        Class<?> clazz = Class.forName(className);
        Object bean = clazz.newInstance();
        MutablePropertyValues propertyValues = beanDefinition.getPropertyValues();
        for (PropertyValue propertyValue : propertyValues) {
            String propertyName = propertyValue.getName();
            String value = propertyValue.getValue();
            String ref = propertyValue.getRef();

            // 依赖注入
            if (StringUtils.hasText(ref)) {
                // 递归调用 getBean()
                Object propertyBean = getBean(propertyName);
                String methodName = StringUtil.getSetterMethodNameByFieldName(propertyName);
                Method[] methods = clazz.getMethods();
                for (Method method : methods) {
                    if (method.getName().equals(methodName)) {
                        method.invoke(bean, propertyBean);
                    }
                }
            }
            if (StringUtils.hasText(value)) {
                String methodName = StringUtil.getSetterMethodNameByFieldName(propertyName);
                Method method = clazz.getMethod(methodName, String.class);
                method.invoke(bean, value);
            }
        }
        singletonObjects.put(name, bean);
        return bean;
    }

    @Override
    public <T> T getBean(String name, Class<? extends T> clazz) throws Exception {
        Object bean = getBean(name);
        return Objects.nonNull(bean) ? clazz.cast(bean) : null;
    }
}
