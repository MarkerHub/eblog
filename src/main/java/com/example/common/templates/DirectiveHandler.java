package com.example.common.templates;

import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.util.Assert;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 引自mbog项目
 *
 * Created by langhsu on 2017/11/14.
 */
public class DirectiveHandler {
    private Environment env;
    private Map<String, TemplateModel> parameters;
    private TemplateModel[] loopVars;
    private TemplateDirectiveBody body;
    private Environment.Namespace namespace;

    /**
     * 构建 DirectiveHandler
     *
     * @param env 系统环境变量，通常用它来输出相关内容，如Writer out = env.getOut()。
     * @param parameters 自定义标签传过来的对象
     * @param loopVars 循环替代变量
     * @param body 用于处理自定义标签中的内容，如<@myDirective>将要被处理的内容</@myDirective>；当标签是<@myDirective />格式时，body=null。
     */
    public DirectiveHandler(Environment env, Map<String, TemplateModel> parameters, TemplateModel[] loopVars,
                            TemplateDirectiveBody body) {
        this.env = env;
        this.loopVars = loopVars;
        this.parameters = parameters;
        this.body = body;
        this.namespace = env.getCurrentNamespace();
    }

    public void render() throws IOException, TemplateException {
        Assert.notNull(body, "must have template directive body");
        body.render(env.getOut());
    }

    public void renderString(String text) throws Exception {
        StringWriter writer = new StringWriter();
        writer.append(text);
        env.getOut().write(text);
    }

    public DirectiveHandler put(String key, Object value) throws TemplateModelException {
        namespace.put(key, wrap(value));
        return this;
    }

    public String getString(String name) throws TemplateModelException {
        return TemplateModelUtils.converString(getModel(name));
    }

    public Integer getInteger(String name) throws TemplateModelException {
        return TemplateModelUtils.converInteger(getModel(name));
    }

    public Short getShort(String name) throws TemplateModelException {
        return TemplateModelUtils.converShort(getModel(name));
    }

    public Long getLong(String name) throws TemplateModelException {
        return TemplateModelUtils.converLong(getModel(name));
    }

    public Double getDouble(String name) throws TemplateModelException {
        return TemplateModelUtils.converDouble(getModel(name));
    }

    public String[] getStringArray(String name) throws TemplateModelException {
        return TemplateModelUtils.converStringArray(getModel(name));
    }

    public Boolean getBoolean(String name) throws TemplateModelException {
        return TemplateModelUtils.converBoolean(getModel(name));
    }

    public Date getDate(String name) throws TemplateModelException {
        return TemplateModelUtils.converDate(getModel(name));
    }

    public String getString(String name, String defaultValue) throws Exception {
        String result = getString(name);
        return null == result ? defaultValue : result;
    }

    public Integer getInteger(String name, int defaultValue) throws Exception {
        Integer result = getInteger(name);
        return null == result ? defaultValue : result;
    }

    public Long getLong(String name, long defaultValue) throws Exception {
        Long result = getLong(name);
        return null == result ? defaultValue : result;
    }


    public String getContextPath() {
        String ret = null;
        try {
            ret =  TemplateModelUtils.converString(getEnvModel("base"));
        } catch (TemplateModelException e) {
        }
        return ret;
    }

    /**
     * 包装对象
     * @param object
     * @return
     * @throws TemplateModelException
     */
    public TemplateModel wrap(Object object) throws TemplateModelException {
        return env.getObjectWrapper().wrap(object);
    }

    /**
     * 获取局部变量
     * @param name
     * @return
     * @throws TemplateModelException
     */
    public TemplateModel getEnvModel(String name) throws TemplateModelException {
        return env.getVariable(name);
    }

    public void write(String text) throws IOException {
        env.getOut().write(text);
    }

    private TemplateModel getModel(String name) {
        return parameters.get(name);
    }

    /**
     * Created by langhsu on 2017/11/14.
     */
    public abstract static class BaseMethod implements TemplateMethodModelEx {

        public String getString(List<TemplateModel> arguments, int index) throws TemplateModelException {
            return TemplateModelUtils.converString(getModel(arguments, index));
        }

        public Integer getInteger(List<TemplateModel> arguments, int index) throws TemplateModelException {
            return TemplateModelUtils.converInteger(getModel(arguments, index));
        }

        public Long getLong(List<TemplateModel> arguments, int index) throws TemplateModelException {
            return TemplateModelUtils.converLong(getModel(arguments, index));
        }

        public Date getDate(List<TemplateModel> arguments, int index) throws TemplateModelException {
            return TemplateModelUtils.converDate(getModel(arguments, index));
        }

        public TemplateModel getModel(List<TemplateModel> arguments, int index) {
            if (index < arguments.size()) {
                return arguments.get(index);
            }
            return null;
        }
    }
}
