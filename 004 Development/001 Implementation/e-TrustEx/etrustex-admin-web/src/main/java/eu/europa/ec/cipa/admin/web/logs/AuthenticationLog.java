package eu.europa.ec.cipa.admin.web.logs;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AuthenticationLog {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Pointcut("execution(@org.springframework.web.bind.annotation.RequestMapping * eu.europa.ec.cipa.admin.web.controller.*.*(..))")
    public void handlerMethods() {}
}
