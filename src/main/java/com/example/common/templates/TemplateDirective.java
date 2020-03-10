package com.example.common.templates;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.Map;

/**
 * Created by langhsu on 2017/11/14.
 */
public abstract class TemplateDirective implements TemplateDirectiveModel {
    protected static String RESULT = "result";
    protected static String RESULTS = "results";

    @Override
    public void execute(Environment env, Map parameters,
                        TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        try {
            execute(new DirectiveHandler(env, parameters, loopVars, body));
        } catch (IOException e) {
            throw e;
        } catch (Exception e) {
            throw new TemplateException(e, env);
        }
    }

    abstract public String getName();
    abstract public void execute(DirectiveHandler handler) throws Exception;

}
