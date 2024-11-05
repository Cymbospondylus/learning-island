package site.bzyl.bitstore.configuration.spring.security;

import site.bzyl.bitstore.base.SystemCode;
import site.bzyl.bitstore.domain.User;
import site.bzyl.bitstore.domain.UserEventLog;
import site.bzyl.bitstore.event.UserEvent;
import site.bzyl.bitstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;


/**
 * @version 3.5.0
 * @description: 用户登出

 * @date  9:45
 */
@Component
public class RestLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

    private final ApplicationEventPublisher eventPublisher;
    private final UserService userService;

    @Autowired
    public RestLogoutSuccessHandler(ApplicationEventPublisher eventPublisher, UserService userService) {
        this.eventPublisher = eventPublisher;
        this.userService = userService;
    }

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        org.springframework.security.core.userdetails.User springUser = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        if (null != springUser) {
            User user = userService.getUserByUserName(springUser.getUsername());
            UserEventLog userEventLog = new UserEventLog(user.getId(), user.getUserName(), user.getRealName(), new Date());
            userEventLog.setContent(user.getUserName() + " 登出了比特商店在线学习系统");
            eventPublisher.publishEvent(new UserEvent(userEventLog));
        }
        RestUtil.response(response, SystemCode.OK);
    }
}
