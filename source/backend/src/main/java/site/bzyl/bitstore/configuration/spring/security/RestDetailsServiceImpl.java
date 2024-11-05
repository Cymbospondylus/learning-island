package site.bzyl.bitstore.configuration.spring.security;

import site.bzyl.bitstore.domain.enums.RoleEnum;
import site.bzyl.bitstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;


/**
 * @version 3.5.0
 * @description: 验证通过之后,第二、三...请求，会调用此类

 * @date  9:45
 */
@Component
public class RestDetailsServiceImpl implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public RestDetailsServiceImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        site.bzyl.bitstore.domain.User user = userService.getUserByUserName(username);

        if (user == null) {
            throw new UsernameNotFoundException("Username  not found.");
        }

        ArrayList<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(RoleEnum.fromCode(user.getRole()).getRoleName()));

        return new User(user.getUserName(), user.getPassword(), grantedAuthorities);
    }
}
