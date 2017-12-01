package eu.europa.ec.cipa.admin.web.logs;

import java.lang.annotation.*;


@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface UserActionsLog {
	/**
	 * The Entity type (e.g. Party, Document, Role etc.)
	 */
    Class entity();
}
