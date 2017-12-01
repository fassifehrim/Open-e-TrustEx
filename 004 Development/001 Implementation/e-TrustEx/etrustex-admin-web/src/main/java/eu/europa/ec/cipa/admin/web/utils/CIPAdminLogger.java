package eu.europa.ec.cipa.admin.web.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CIPAdminLogger {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
//	@Pointcut("execution(* eu.europa.ec.cipa.admin.web.controller.*.*(..))")
//    public void controllerMethods() {}
	
	@Pointcut("execution(@org.springframework.web.bind.annotation.RequestMapping * eu.europa.ec.cipa.admin.web.controller.*.*(..))")
    public void handlerMethods() {}
	
	
	@Before("handlerMethods()")
    public void methodCalled(JoinPoint jp) {
        log.debug(jp.getSignature().getDeclaringTypeName() + ". ", jp.getSignature().getName() + ". ", " called...");
    }
	
	@AfterReturning("handlerMethods()")
    public void methodReturned(JoinPoint jp) {
        log.debug(jp.getSignature().getDeclaringTypeName() + ". ", jp.getSignature().getName() + ". ", " returned...");
    }
	
	@AfterThrowing(pointcut="handlerMethods()", throwing="e")
    public void methodThrowing(JoinPoint jp, Throwable e) {
		log.error(jp.getSignature().getDeclaringTypeName() + ". ", jp.getSignature().getName() + ". ", e);
    }
}
